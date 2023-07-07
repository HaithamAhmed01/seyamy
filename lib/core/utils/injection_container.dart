import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:seyamy/core/utils/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

  // Blocs

  // Use cases

  // Repository

  // Data Sources

  //! Core

  //! External

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppInterceptors(
        sl(),
        client: sl(),
      ));
}
