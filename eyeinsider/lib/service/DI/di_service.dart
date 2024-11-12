
import 'package:eyeinsider/providers/user_detail_provider.dart';
import 'package:eyeinsider/service/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';
// class DI {
//   static GetIt i = GetIt.instance;

//   static void initialize() {
//     i.registerLazySingleton<NavigationService>(() => NavigationService());
//     i.registerLazySingleton<UserDetailsRepo>(() => UserDetailsRepoImpl(dataSource: UserDetailDataSource));
//     i.registerLazySingleton<UserDetailsProvider> (()=> UserDetailsProvider(userDetailsRepo: UserDetailsRepo));


//   }
// }


class DI {
  static GetIt i = GetIt.instance;

  static void initialize() {
    // Register NavigationService
    i.registerLazySingleton<NavigationService>(() => NavigationService());

    i.registerLazySingleton<UserDetailsProvider>(
      () => UserDetailsProvider(),
    );
  }
}

