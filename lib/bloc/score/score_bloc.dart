import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/score.dart';
import 'package:firemax_football/network/api_repository.dart'; 
import 'package:flutter/material.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreInitial()) {
    on<LoadScore>((event, emit) async {
      ApiRepository apiRepository = ApiRepository();

      emit(ScoreWaiting());

      final data = await apiRepository.getScore(event.date, event.page);

      if (data == null) {
        emit(ScoreError());
      } else {
        emit(ScoreLoaded(modelScore: data));
      }
    });
  }
}
