import 'package:flutter/material.dart';
import '../pages/components/picture_card.dart' show PictureCard;

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _NewsFeedState();
  }
}

class _NewsFeedState extends State<NewsFeed> {
  final ScrollController scrollController = ScrollController();
  List<Widget> pictureCards = <Widget>[];

  @override
  void initState() {
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    pictureCards.add(PictureCard());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: pictureCards,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
