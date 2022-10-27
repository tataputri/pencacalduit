part of 'channel_bloc.dart';

@immutable
abstract class ChannelEvent {}

class LoadChannel extends ChannelEvent {
  final int matchId;

  LoadChannel(this.matchId);
}
