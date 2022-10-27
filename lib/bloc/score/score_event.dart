part of 'score_bloc.dart';

@immutable
abstract class ScoreEvent {}

class LoadScore extends ScoreEvent {
  final String date;
  final String page;

  LoadScore({required this.date, required this.page});
}
