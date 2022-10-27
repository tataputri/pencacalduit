part of 'today_bloc.dart';

@immutable
abstract class TodayState {}

class TodayInitial extends TodayState {}

class TodayWaiting extends TodayState {}

class TodayError extends TodayState {}

class TodayLoaded extends TodayState {
  final ModelToday modelToday;

  TodayLoaded(this.modelToday);
}
