import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocListenerTree;
import '../../../blocs/picture/picture_bloc.dart' show PictureBloc;
import '../../../blocs/picture/picture_event.dart'
    show FullScreenButtonPressed, PictureEvent, LikeButtonPressed;
import '../../../blocs/picture/picture_state.dart'
    show
    PictureIsNotLiked,
    PictureIsLiked,
    PictureIsNotFullscreen,
    PictureIsFullscreen,
    PictureState;
import '../../../models/picture.dart' show Picture;
import 'full_screen_button.dart' show FullScreenButton;
import 'like.dart' show Like;

class PictureCard extends StatefulWidget {
  const PictureCard({this.picture, this.pictureBloc});

  final Picture picture;
  final PictureBloc pictureBloc;

  @override
  State<StatefulWidget> createState() {
    return _PictureCardState();
  }
}

class _PictureCardState extends State<PictureCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(widget.picture.url))),
        margin: const EdgeInsets.only(bottom: 5),
        height: MediaQuery
            .of(context)
            .size
            .height / 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FullScreenButton(),
            BlocBuilder<PictureEvent, PictureState>(
              bloc: widget.pictureBloc,
              builder: (BuildContext context, PictureState state) {
                return Like(
                    pictureBloc: widget.pictureBloc, pictureState: state);
              },
            )
          ],
        ));
  }
}
