import 'package:bloc/bloc.dart';
import '../../../data/models/Mosque.dart';
import '../../../data/services/MasjidService.dart';
import 'package:flutter/material.dart';

part 'mosque_event.dart';
part 'mosque_state.dart';

class MosqueBloc extends Bloc<MosqueEvent, MosqueState> {
  final MasjidService masjidService;

  MosqueBloc({required this.masjidService}) : super(MosqueInitial()) {
    on<FetchMosques>(_onFetchMosques);
  }

  void _onFetchMosques(FetchMosques event, Emitter<MosqueState> emit) async {
    emit(MosqueLoading());
    try {
      final mosques = await masjidService.fetchNearbyMosques(event.lat, event.lng);
      emit(MosqueLoaded(mosques: mosques));
    } catch (e) {
      emit(MosqueError(message: e.toString()));
    }
  }
}
