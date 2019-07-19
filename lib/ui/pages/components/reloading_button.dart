import 'package:flutter/material.dart';
import '../../../blocs/picture/picture_bloc.dart' show PictureBloc;
import '../../../blocs/picture/picture_event.dart' show StartDownloading;

class ReloadingButton extends StatelessWidget {
  const ReloadingButton({@required this.pictureBloc});

  final PictureBloc pictureBloc;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => pictureBloc.dispatch(StartDownloading()),
      icon: Icon(Icons.repeat),
    );
  }
}
