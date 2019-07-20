import 'package:flutter/material.dart';
import '../../../blocs/picture/picture_bloc.dart' show PictureBloc;
import '../../../blocs/picture/picture_event.dart' show LikeButtonPressed;
import '../../../blocs/picture/picture_state.dart'
    show PictureIsLiked, PictureState;
import '../../../models/picture.dart' show Picture;
import 'full_screen.dart' show FullScreenPage;

class FullScreenButton extends StatefulWidget {
  const FullScreenButton(
      {this.isFullScreen, this.pictureBloc, this.pictureState, this.picture});

  final bool isFullScreen;
  final PictureBloc pictureBloc;
  final PictureState pictureState;
  final Picture picture;

  @override
  State<StatefulWidget> createState() {
    return _FullScreenButtonState();
  }
}

class _FullScreenButtonState extends State<FullScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: IconButton(
        color: Colors.white,
        icon: widget.isFullScreen ? Icon(Icons.undo) : Icon(Icons.aspect_ratio),
        onPressed: () {
          widget.isFullScreen
              ? Navigator.pop(context)
              : Navigator.push(
              context,
              MaterialPageRoute<Route<Widget>>(
                  builder: (BuildContext context) =>
                      FullScreenPage(
                          pictureState: widget.pictureState,
                          pictureBloc: widget.pictureBloc,
                          picture: widget.picture)));
        },
      ),
      alignment: const Alignment(0, 0.8),
    );
  }
}
