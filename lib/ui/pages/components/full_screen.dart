import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocListenerTree;
import '../../../blocs/picture/picture_bloc.dart' show PictureBloc;
import '../../../blocs/picture/picture_event.dart'
    show FullScreenButtonPressed, PictureEvent, LikeButtonPressed;
import '../../../blocs/picture/picture_state.dart'
    show PictureIsNotLiked, PictureIsLiked, PictureState;
import '../../../models/picture.dart' show Picture;
import 'full_screen_button.dart' show FullScreenButton;
import 'like.dart' show Like;

class FullScreenPage extends StatelessWidget {
  const FullScreenPage({this.pictureBloc, this.pictureState, this.picture});

  final PictureBloc pictureBloc;
  final PictureState pictureState;
  final Picture picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(picture.url), fit: BoxFit.contain),
            ),
            child: BlocBuilder<PictureEvent, PictureState>(
              bloc: pictureBloc,
              builder: (BuildContext context, PictureState state) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FullScreenButton(
                        isFullScreen: true,
                        picture: picture,
                        pictureState: pictureState,
                        pictureBloc: pictureBloc,
                      ),
                      Like(pictureBloc: pictureBloc, pictureState: state)
                    ]);
              },
            )));
  }
}
