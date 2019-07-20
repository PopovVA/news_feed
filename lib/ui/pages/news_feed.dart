import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocListenerTree;
import '../../blocs/application/app_bloc.dart' show AppBloc;
import '../../blocs/application/app_event.dart'
    show AppStarted, AppScrolling, AppEvent;
import '../../blocs/application/app_state.dart'
    show AppState, DataLoaded, DataLoading, DataLoadingError;
import '../../models/picture.dart' show Picture;
import '../pages/components/loading_card.dart' show LoadingCard;
import '../pages/components/picture_card.dart' show PictureCard;

class NewsFeed extends StatefulWidget {
  NewsFeed({Key key, @required this.title, @required this.appBloc})
      : super(key: key);

  final String title;
  final AppBloc appBloc;
  final List<Widget> pictureCards = <Widget>[];

  @override
  State<StatefulWidget> createState() {
    return _NewsFeedState();
  }
}

class _NewsFeedState extends State<NewsFeed> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    widget.appBloc.dispatch(AppStarted());
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      widget.appBloc.dispatch(AppScrolling());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.repeat),
              onPressed: () {
                widget.pictureCards.clear();
                widget.appBloc.dispatch(AppStarted());
              })
        ]),
        body: BlocListener<AppEvent, AppState>(
            bloc: widget.appBloc,
            listener: (BuildContext context, AppState state) {
              if (state is DataLoadingError) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: const Text('Loading error')));
              }
            },
            child: BlocBuilder<AppEvent, AppState>(
              bloc: widget.appBloc,
              builder: (BuildContext context, AppState state) {
                if (state is DataLoaded) {
                  return Stack(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: ListView(
                                controller: scrollController,
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: _buildComponents(state),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                if (state is DataLoading) {
                  return widget.pictureCards.isEmpty
                      ? Center(
                      child: Container(
                        alignment: const Alignment(0, 0),
                        child: const CircularProgressIndicator(),
                      ))
                      : _buildList();
                }
                if (state is DataLoadingError) {
                  return widget.pictureCards.isEmpty
                      ? Center(
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3,
                          child: const Text('Something went wrong')))
                      : _buildList();
                }
                return Container();
              },
            )));
  }

  Widget _buildList() {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: _buildLoadingComponents(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildLoadingComponents() {
    final List<Widget> loadingWidgets = <Widget>[];
    loadingWidgets.addAll(widget.pictureCards);
    loadingWidgets.add(LoadingCard());
    return loadingWidgets;
  }

  List<Widget> _buildComponents(DataLoaded state) {
    for (Picture picture in state.pictures) {
      widget.pictureCards.add(PictureCard(picture: picture));
    }
    return widget.pictureCards;
  }
}
