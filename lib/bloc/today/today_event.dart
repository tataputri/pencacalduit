part of 'today_bloc.dart';

@immutable
abstract class TodayEvent {}

class LoadToday extends TodayEvent{
  final int page;

  LoadToday(this.page);
}