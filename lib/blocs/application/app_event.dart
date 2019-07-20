import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
abstract class AppEvent extends Equatable {
  AppEvent([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class AppStarted extends AppEvent {
  @override
  String toString() => 'AppStarted';
}

class AppScrolling extends AppEvent {
  @override
  String toString() => 'AppScrolling';
}
