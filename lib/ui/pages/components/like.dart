import 'package:flutter/material.dart';
import '../../../blocs/picture/picture_bloc.dart' show PictureBloc;
import '../../../blocs/picture/picture_event.dart' show LikeButtonPressed;
import '../../../blocs/picture/picture_state.dart'
    show PictureIsLiked, PictureState;

class Like extends StatefulWidget {

  const Like({this.pictureBloc, this.pictureState});

  final PictureBloc pictureBloc;
  final PictureState pictureState;

  @override
  State<StatefulWidget> createState() {
    return _LikeState();
  }
}

class _LikeState extends State<Like> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: IconButton(
        color: Colors.white,
        icon: widget.pictureState is PictureIsLiked ? Icon(Icons.star) : Icon(
            Icons.star_border),
        onPressed: () {
          setState(() {
            widget.pictureBloc.dispatch(LikeButtonPressed(
                like: widget.pictureState is PictureIsLiked ? false : true));
          });
        },
      ),
      alignment: const Alignment(0, 0.8),
    );
  }
}
