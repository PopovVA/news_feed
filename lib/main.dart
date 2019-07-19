import 'package:flutter/material.dart';

import 'ui/pages/news_feed.dart' show NewsFeed;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsFeed(title: 'News feed'),
    );
  }
}
