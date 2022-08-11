part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchWaiting extends SearchState {}

class SearchError extends SearchState {}

class SearchLoaded extends SearchState {
  final List<DataBola>? dataSearch;

  SearchLoaded({this.dataSearch});
}
