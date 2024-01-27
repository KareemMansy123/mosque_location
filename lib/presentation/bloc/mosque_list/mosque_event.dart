
part of 'mosque_bloc.dart';

@immutable
abstract class MosqueEvent {}

class FetchMosques extends MosqueEvent {
  final double lat;
  final double lng;

  FetchMosques(this.lat, this.lng);
}
