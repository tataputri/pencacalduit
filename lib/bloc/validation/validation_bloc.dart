import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/model_validation.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<LoadValidation>((event, emit) async {
      ApiRepository apiRepository = ApiRepository();

      emit(ValidationWaiting());

      final data = await apiRepository.getValidation();
      if (data == null) {
        emit(ValidationError());
      } else {
        emit(ValidationLoaded(data));
      }
    });
  }
}
