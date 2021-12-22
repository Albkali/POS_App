import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pos/repository/auth_repo.dart';
import 'package:pos/repository/contect_repo.dart';
import 'package:pos/repository/pos_repo.dart';
import 'package:pos/repository/sell_repo.dart';
import 'package:pos/ui/add_new_contact/add_new_contact_view_model.dart';
import 'package:pos/ui/auth/login/login_view_model.dart';
import 'package:pos/ui/sell/show_sell/list_of_sell_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/dio/logging_interceptor.dart';
import '../ui/pos/pos_page_view_model.dart';
import '../utils/constants/api_end_points.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => DioClient(
        ApiEndPoints.BASE_URL,
        sl(),
        loggingInterceptor: sl(),
      ));

  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(),));
  sl.registerLazySingleton(() => LoginViewModel(authRepo: sl()));
  sl.registerLazySingleton(() => SellRepo(dioClient: sl(),));
  sl.registerLazySingleton(() => ListOfSellViewModel(sellRepo: sl()));
  sl.registerLazySingleton(() => ContactRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AddNewContactViewModel(contactRepo: sl()));
  sl.registerLazySingleton(() => PosPageViewModel(posRepo: sl()));
  sl.registerLazySingleton(() => PosRepo(dioClient: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
