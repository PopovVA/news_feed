import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
abstract class PictureState extends Equatable {
  PictureState([List<dynamic> props = const <dynamic>[]]) : super(props);

  @override
  String toString();
}

class PictureIsLiked extends PictureState {
  @override
  String toString() => 'PictureLiked';
}

class PictureIsNotLiked extends PictureState {
  @override
  String toString() => 'PictureIsNotLiked';
}

class PictureIsFullscreen extends PictureState {
  @override
  String toString() => 'PictureIsFullscreen';
}

class PictureIsNotFullscreen extends PictureState {
  @override
  String toString() => 'PictureIsNotFullscreen';
}
