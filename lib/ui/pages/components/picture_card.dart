import 'package:flutter/material.dart';
import '../../../models/picture.dart' show Picture;
import 'full_screen_button.dart' show FullScreenButton;
import 'like.dart' show Like;



class PictureCard extends StatefulWidget {
  const PictureCard({this.picture});

  final Picture picture;

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
            Like()
          ],
        ));
  }
}
