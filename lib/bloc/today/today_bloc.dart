import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/today.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'today_event.dart';
part 'today_state.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc() : super(TodayInitial()) {
    on<LoadToday>((event, emit) async {
      emit(TodayWaiting());

      ApiRepository apiRepository = ApiRepository();

      final data = await apiRepository.getToday("${event.page}");

      if (data == null) {
        emit(TodayError());
      } else {
        emit(TodayLoaded(data));
      }
    });
  }
}
