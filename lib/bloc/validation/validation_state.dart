part of 'validation_bloc.dart';

@immutable
abstract class ValidationState {}

class ValidationInitial extends ValidationState {}

class ValidationWaiting extends ValidationState {}

class ValidationError extends ValidationState {}

class ValidationLoaded extends ValidationState {
  final ModelValidation modelValidation;

  ValidationLoaded(this.modelValidation);
}
