part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchWaiting extends SearchState {}

class SearchError extends SearchState {}

class SearchNull extends SearchState {}

class SearchLoaded extends SearchState {
  final ModelSearch? dataSearch;

  SearchLoaded({this.dataSearch});
}
