part of 'jadwal_bloc.dart';

@immutable
abstract class JadwalState {}

class JadwalInitial extends JadwalState {}

class JadwalWaiting extends JadwalState {}

class JadwalError extends JadwalState {}

class JadwalLoaded extends JadwalState {
  final ModelJadwal modelJadwal;

  JadwalLoaded({required this.modelJadwal});
}
