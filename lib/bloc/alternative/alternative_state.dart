part of 'alternative_bloc.dart';

@immutable
abstract class AlternativeState {}

class AlternativeInitial extends AlternativeState {}

class AlternativeWaiting extends AlternativeState {}

class AlternativeError extends AlternativeState {}

class AlternativeLoaded extends AlternativeState {
  final ModelAlternative modelAlternative;

  AlternativeLoaded(this.modelAlternative);
}
