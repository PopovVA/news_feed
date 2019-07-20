import 'package:flutter/material.dart';

import 'blocs/application/app_bloc.dart' show AppBloc;
import 'repositories/picture_repository.dart' show PictureRepository;
import 'ui/pages/news_feed.dart' show NewsFeed;

void main() {
  final AppBloc appBloc = AppBloc(pictureRepository: PictureRepository());
  runApp(MyApp(appBloc: appBloc));
}

class MyApp extends StatelessWidget {
  const MyApp({this.appBloc});

  final AppBloc appBloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News feed',
        theme: ThemeData.dark(),
        home: NewsFeed(title: 'News feed', appBloc: appBloc));
  }
}
