import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
abstract class PictureEvent extends Equatable {
  PictureEvent([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class StartDownloading extends PictureEvent {
  @override
  String toString() => 'StartDownloading';
}
