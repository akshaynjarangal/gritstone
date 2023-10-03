  // Initialize GetIt
import 'package:elthor/src/data/repositories/ride_repo.dart';
import 'package:elthor/src/data/services/ride_implementation.dart';
import 'package:elthor/src/data/services/ride_service.dart';
import 'package:elthor/src/providers/ride_provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<RideService>(() => RideImpl());
  getIt.registerLazySingleton<RideRepo>(() => RideRepo(rideService: getIt<RideService>()));
  getIt.registerFactory<RideProvider>(() => RideProvider(rideRepo : getIt<RideRepo>()));
}