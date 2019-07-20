import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;
import '../../models/picture.dart' show Picture;

@immutable
abstract class AppState extends Equatable {
  AppState([List<dynamic> props = const <dynamic>[]]) : super(props);

  @override
  String toString();
}

class DataLoading extends AppState {
  @override
  String toString() => 'DataLoading';
}

class DataLoaded extends AppState {
  DataLoaded(this.pictures);

  final List<Picture> pictures;

  @override
  String toString() => 'DataLoaded';
}

class DataLoadingError extends AppState {
  DataLoadingError(this.error);

  final String error;

  @override
  String toString() => error;
}
