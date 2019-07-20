import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        margin: const EdgeInsets.only(bottom: 5),
        height: MediaQuery.of(context).size.height / 3,
        child: Container(
            alignment: const Alignment(0, 0),
            child: const CircularProgressIndicator()));
  }
}
