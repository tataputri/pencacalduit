part of 'jadwal_bloc.dart';

@immutable
abstract class JadwalEvent {}

class LoadJadwal extends JadwalEvent {
  final String date;
  final String page;

  LoadJadwal({required this.date, required this.page});
}
