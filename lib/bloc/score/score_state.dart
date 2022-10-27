part of 'score_bloc.dart';

@immutable
abstract class ScoreState {}

class ScoreInitial extends ScoreState {}

class ScoreWaiting extends ScoreState {}

class ScoreError extends ScoreState {}

class ScoreLoaded extends ScoreState {
  final ModelScore modelScore;

  ScoreLoaded({required this.modelScore});
}
