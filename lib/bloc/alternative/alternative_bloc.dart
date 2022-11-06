import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/alternative.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'alternative_event.dart';
part 'alternative_state.dart';

class AlternativeBloc extends Bloc<AlternativeEvent, AlternativeState> {
  AlternativeBloc() : super(AlternativeInitial()) {
    on<LoadAlternative>((event, emit) async {
      emit(AlternativeWaiting());
      ApiRepository apiRepository = ApiRepository();

      final data = await apiRepository.getAlternative();

      if (data == null) {
        emit(AlternativeError());
      } else {
        emit(AlternativeLoaded(data));
      }
    });
  }
}
