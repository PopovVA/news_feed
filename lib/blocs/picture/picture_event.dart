import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable, required;

@immutable
abstract class PictureEvent extends Equatable {
  PictureEvent([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class LikeButtonPressed extends PictureEvent {
  LikeButtonPressed({@required this.like}) : super(<dynamic>[like]);

  final bool like;

  @override
  String toString() => 'LikeButtonPressed';
}

//class FullScreenButtonPressed extends PictureEvent {
//  FullScreenButtonPressed({@required this.isFullScreen})
//      : super(<dynamic>[isFullScreen]);
//
//  final bool isFullScreen;
//
//  @override
//  String toString() => 'FullScreenButtonPressed';
//}
