import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pos/repository/auth_repo.dart';
import 'package:pos/repository/sell_repo.dart';
import 'package:pos/ui/auth/login/login_view_model.dart';
import 'package:pos/ui/sell/show_sell/list_of_sell_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'utils/constants/api_end_points.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(
        ApiEndPoints.BASE_URL,
        sl(),
        loggingInterceptor: sl(),
      ));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(
        dioClient: sl(),
      ));
  sl.registerLazySingleton(() => LoginViewModel(authRepo: sl()));
  sl.registerLazySingleton(() => SellRepo(
        dioClient: sl(),
      ));
  sl.registerLazySingleton(() => ListOfSellViewModel(sellRepo: sl()));
  // sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
