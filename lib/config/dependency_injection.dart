import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/network/app_api.dart';
import 'package:nuntium/core/network/dio_factory.dart';
import 'package:nuntium/core/storage/local/appSettingsSharedPreferences.dart';
import 'package:nuntium/features/auth/data/data_source/remote_data_source.dart';
import 'package:nuntium/features/out_boarding/presentaion/controller/out_boarding_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/splash/controller/splash_controller.dart';

final instance = GetIt.instance;

initModule() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  // TODO: ONLY FOR TEST
  // AppSettingsPreferences appSettingsPreferences =
  //     instance<AppSettingsPreferences>();
  // appSettingsSharedPreferences.clear();

  //why ? you dont use generic type in bellow!
  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  // what are classes you register in getIt from all the classes in the app
  instance.registerLazySingleton<AppApi>(
    () => AppApi(dio),
  );

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionCheckerPlus()));
}

initSplash() {
  Get.put<SplashController>(SplashController());
  print("Get.put<SplashController>(SplashController());");
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoardingController>(OutBoardingController());
  print("Get.put<OutBoardingController>(OutBoardingController());");
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() {
  disposeSplash();
  disposeOutBoarding();
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }
}

initWelcomeModule() {
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }
}
