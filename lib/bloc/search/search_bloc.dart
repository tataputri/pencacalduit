import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<LoadSearch>((event, emit) async {
      emit(SearchWaiting());
      ApiRepository apiRepository = ApiRepository();

      final data = await apiRepository.getSearch(event.keyword!);
       
      if (data!.data!.isEmpty) {
        emit(SearchError());
      } else {
        emit(SearchLoaded(dataSearch: data.data));
      }
    });
  }
}
