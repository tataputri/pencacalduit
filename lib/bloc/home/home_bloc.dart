import 'package:bloc/bloc.dart';
import 'package:firemax_football/models/model_home.dart';
import 'package:firemax_football/network/api_repository.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHome>((event, emit) async {
      emit(HomeWaiting());
      ApiRepository apiRepository = ApiRepository();
      List<DataBola> dataLive = [];
      List<String> dataLiga = [];

      final data = await apiRepository.getHome();
      if (data!.data!.isNotEmpty) {
        for (var datas in data.data!) {
          if (datas.isLive == "online") {
            dataLive.add(datas);
          }
          dataLiga.add(datas.leagueName!);
        }
        emit(HomeLoaded(
          dataLive: dataLive,
          dataLiga: dataLiga,
          allMatch: data.data
        ));
      } else {
        emit(HomeError());
      }
 
    });
  }
}
