import 'package:flutter/material.dart';

class FullScreenButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FullScreenButtonState();
  }
}

class _FullScreenButtonState extends State<FullScreenButton> {
  bool isFullScreen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: IconButton(
        color: Colors.white,
        icon: isFullScreen ? Icon(Icons.undo) : Icon(Icons.aspect_ratio),
        onPressed: () {
          setState(() {
            isFullScreen = !isFullScreen;
          });
        },
      ),
      alignment: const Alignment(0, 0.8),
    );
  }
}
