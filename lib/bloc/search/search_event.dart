part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class LoadSearch extends SearchEvent {
  final String keyword;
  final String page;

  LoadSearch({required this.page, required this.keyword});
}
