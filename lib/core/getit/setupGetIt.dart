import 'package:get_it/get_it.dart';

import '../../data/services/MasjidService.dart';
import '../../presentation/bloc/mosque_list/mosque_bloc.dart';


final getIt = GetIt.instance;

void setupGetIt() {
  // Services
  getIt.registerLazySingleton<MasjidService>(() => MasjidService());
  //------------------------------------------------------------
  // Bloc
  getIt.registerFactory<MosqueBloc>(() => MosqueBloc(masjidService: getIt()));
}
