import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import '../../../blocs/picture/picture_bloc.dart' show PictureBloc;
import '../../../blocs/picture/picture_event.dart'
    show StartDownloading, PictureEvent;
import '../../../blocs/picture/picture_state.dart'
    show PictureState, DataLoaded, DataLoading, DataLoadingError;
import '../../../repositories/picture_repository.dart' show PictureRepository;
import 'like.dart' show Like;
import 'reloading_button.dart' show ReloadingButton;

class PictureCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PictureCardState();
  }
}

class _PictureCardState extends State<PictureCard> {
  PictureBloc _pictureBloc;

  @override
  void initState() {
    _pictureBloc = PictureBloc(pictureRepository: PictureRepository());
    _pictureBloc.dispatch(StartDownloading());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocBuilder<PictureEvent, PictureState>(
      bloc: _pictureBloc,
      builder: (BuildContext context, PictureState state) {
        if (state is DataLoaded) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(state.picture.url))),
              margin: const EdgeInsets.only(bottom: 5),
              height: MediaQuery.of(context).size.height / 3,
              child: Like());
        }
        if (state is DataLoading) {
          return Container(
              color: Colors.grey,
              margin: const EdgeInsets.only(bottom: 5),
              height: MediaQuery.of(context).size.height / 3,
              child: const CircularProgressIndicator());
        }
        if (state is DataLoadingError) {
          return Container(
              color: Colors.grey,
              margin: const EdgeInsets.only(bottom: 5),
              height: MediaQuery.of(context).size.height / 3,
              child: ReloadingButton(pictureBloc: _pictureBloc));
        }
        return Container();
      },
    ));
  }
}
