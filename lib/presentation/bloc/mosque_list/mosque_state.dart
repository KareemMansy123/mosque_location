part of 'mosque_bloc.dart';

@immutable
abstract class MosqueState {}

class MosqueInitial extends MosqueState {}

class MosqueLoading extends MosqueState {}

class MosqueLoaded extends MosqueState {
  final List<Mosque> mosques;

  MosqueLoaded({required this.mosques});
}

class MosqueError extends MosqueState {
  final String message;

  MosqueError({required this.message});
}
