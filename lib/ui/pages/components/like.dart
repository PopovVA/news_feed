import 'package:flutter/material.dart';

class Like extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LikeState();
  }
}

class _LikeState extends State<Like> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: IconButton(
        color: Colors.white,
        icon: isLiked ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
      ),
      alignment: const Alignment(0, 0.8),
    );
  }
}
