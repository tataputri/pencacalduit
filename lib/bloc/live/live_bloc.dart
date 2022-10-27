import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/live.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'live_event.dart';
part 'live_state.dart';

class LiveBloc extends Bloc<LiveEvent, LiveState> {
  LiveBloc() : super(LiveInitial()) {
    on<LoadLive>((event, emit) async {
      emit(LiveWaiting());
      ApiRepository apiRepository = ApiRepository();

      final data = await apiRepository.getLive();

      if (data == null) {
        emit(LiveError());
      } else {
        if (data.result!.isEmpty) {
          emit(LiveError());
        } else {
          emit(LiveLoaded(data));
        }
      }
    });
  }
}
