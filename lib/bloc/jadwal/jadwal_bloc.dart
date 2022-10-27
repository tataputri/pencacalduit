import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/jadwal.dart';
import 'package:firemax_football/network/api_repository.dart'; 
import 'package:flutter/material.dart';

part 'jadwal_event.dart';
part 'jadwal_state.dart';

class JadwalBloc extends Bloc<JadwalEvent, JadwalState> {
  JadwalBloc() : super(JadwalInitial()) {
    on<LoadJadwal>((event, emit) async {
      ApiRepository apiRepository = ApiRepository();

      emit(JadwalWaiting());
      final data = await apiRepository.getJadwal(event.date, event.page);

      if (data == null) {
        emit(JadwalError());
      } else {
        emit(JadwalLoaded(modelJadwal: data));
      }
    });
  }
}
