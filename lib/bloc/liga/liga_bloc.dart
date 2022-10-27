// import 'package:bloc/bloc.dart';
// import 'package:firemax_football/models/model_home.dart';
// import 'package:firemax_football/network/api_repository.dart';
// import 'package:flutter/material.dart';

// part 'liga_event.dart';
// part 'liga_state.dart';

// class LigaBloc extends Bloc<LigaEvent, LigaState> {
//   LigaBloc() : super(LigaInitial()) {
//     on<LoadLiga>((event, emit) async {
//       emit(LigaWaiting());
//       ApiRepository api = ApiRepository();
//       List<DataBola> dataByLIga = [];

//       final data = await api.getHome();

//       for (var element in data!.data!) {
//         if (element.leagueName == event.namaLiga) {
//           dataByLIga.add(element);
//         }
//       }

//       if (dataByLIga.isEmpty) {
//         emit(LigaError());
//       } else {
//         emit(LigaLoaded(dataByLIga));
//       }
//     });
//   }
// }
