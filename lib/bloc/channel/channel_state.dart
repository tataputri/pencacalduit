part of 'channel_bloc.dart';

@immutable
abstract class ChannelState {}

class ChannelInitial extends ChannelState {}

class ChannelWaiting extends ChannelState {}

class ChannelError extends ChannelState {}

class ChannelLoaded extends ChannelState {
  final DataChannel modelChannel;
 
  ChannelLoaded(this.modelChannel);
}
