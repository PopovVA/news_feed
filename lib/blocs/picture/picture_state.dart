import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;
import '../../models/picture.dart' show Picture;

@immutable
abstract class PictureState extends Equatable {
  PictureState([List<dynamic> props = const <dynamic>[]]) : super(props);

  @override
  String toString();
}

class DataLoading extends PictureState {
  @override
  String toString() => 'DataLoading';
}

class DataLoaded extends PictureState {
  DataLoaded(this.picture);

  final Picture picture;

  @override
  String toString() => 'DataLoaded';
}

class DataLoadingError extends PictureState {
  DataLoadingError(this.error);

  final String error;

  @override
  String toString() => error;
}
