import 'package:bloc/bloc.dart'; 
import 'package:firemax_football/models/search.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<LoadSearch>((event, emit) async {
      emit(SearchWaiting());
      ApiRepository apiRepository = ApiRepository();

      final data = await apiRepository.getSearch(event.keyword, event.page);

      if (data == null) {
        emit(SearchError());
      } else if (data.result!.isEmpty) {
        emit(SearchNull());
      } else {
        emit(SearchLoaded(dataSearch: data));
      }
    });
  }
}
