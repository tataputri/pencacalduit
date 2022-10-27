import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc() : super(DateInitial()) {
    on<LoadDate>((event, emit) {
      final jadwal = getRangeJadwal(
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 7),
      );
      final score = getRangeScore(
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 5),
      );

      if (jadwal.isEmpty && score.isEmpty) {
        emit(DateError());
      } else {
        emit(DateLoaded(jadwal, score));
      }
    });
  }
}

List<ModelDate> getRangeJadwal(DateTime startDate, DateTime endDate) {
  List<ModelDate> days = [];
  var name = DateFormat("yyyy-MM-dd");
  var value = DateFormat("MMM, d");
  // log(startDate.toString());
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(
      ModelDate(
          nama: name.format(
            startDate.add(
              Duration(days: i),
            ),
          ),
          value: value.format(
            startDate.add(
              Duration(days: i),
            ),
          )),
    );
  }
  return days;
}

List<ModelDate> getRangeScore(DateTime startDate, DateTime endDate) {
  List<ModelDate> days = [];
  var name = DateFormat("yyyy-MM-dd");
  var value = DateFormat("MMM, d");

  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(
      ModelDate(
          nama: name.format(
            startDate.subtract(
              Duration(days: i),
            ),
          ),
          value: value.format(
            startDate.subtract(
              Duration(days: i),
            ),
          )),
    );
  }
  return days;
}

class ModelDate {
  String? nama;
  String? value;

  ModelDate({this.nama, this.value});
}
