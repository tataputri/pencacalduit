part of 'date_bloc.dart';

@immutable
abstract class DateState {}

class DateInitial extends DateState {}

class DateWaiting extends DateState {}

class DateError extends DateState {}

class DateLoaded extends DateState {
 
  final List<ModelDate> modeldate;
  final List<ModelDate> scoreDate;

  DateLoaded(this.modeldate, this.scoreDate);
}
