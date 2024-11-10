
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';
class DI {
  static GetIt i = GetIt.instance;

  static void initialize() {
    i.registerLazySingleton<NavigationService>(() => NavigationService());
    
  }
}

