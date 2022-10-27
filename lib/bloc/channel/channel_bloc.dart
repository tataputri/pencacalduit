import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/channel.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelInitial()) {
    on<LoadChannel>((event, emit) async {
      emit(ChannelWaiting());
      ApiRepository apiRepository = ApiRepository();

      final data = await apiRepository.getChannel();

      if (data == null) {
        emit(ChannelError());
      } else {
        if (data.data!.isEmpty) {
          emit(ChannelError());
        } else {
          for (var element in data.data!) {
            if (event.matchId == element.matchId) {
              emit(
                ChannelLoaded(element),
              );
            } else {
              emit(ChannelError());
            }
          }
        }
      }
    });
  }
}
