import 'package:get_it/get_it.dart';
import 'package:meet_app/feture/auth/data/repository/auth_repository.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp());
  }
}
