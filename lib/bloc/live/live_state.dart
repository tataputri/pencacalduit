part of 'live_bloc.dart';

@immutable
abstract class LiveState {}

class LiveInitial extends LiveState {}

class LiveWaiting extends LiveState {}

class LiveError extends LiveState {}

class LiveLoaded extends LiveState {
  final ModelLive modelLive;

  LiveLoaded(this.modelLive);
}
