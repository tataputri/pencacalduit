part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeWaiting extends HomeState {}

class HomeError extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DataBola>? dataLive;
  final List<String>? dataLiga ;
  final List<DataBola>? allMatch;

  HomeLoaded({this.dataLiga, this.dataLive, this.allMatch});
}
