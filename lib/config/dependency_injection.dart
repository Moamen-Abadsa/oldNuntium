import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/network/app_api.dart';
import 'package:nuntium/core/network/dio_factory.dart';
import 'package:nuntium/core/storage/local/appSettingsSharedPreferences.dart';
import 'package:nuntium/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:nuntium/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:nuntium/features/auth/data/repository/login_repository.dart';
import 'package:nuntium/features/auth/data/repository/register_repository.dart';
import 'package:nuntium/features/auth/domain/use_case/login_use_case.dart';
import 'package:nuntium/features/auth/domain/use_case/register_use_case.dart';
import 'package:nuntium/features/auth/presentation/controller/login_controller.dart';
import 'package:nuntium/features/auth/presentation/controller/register_controller.dart';
import 'package:nuntium/features/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:nuntium/features/home/presentation/controller/home_controller.dart';
import 'package:nuntium/features/out_boarding/presentaion/controller/out_boarding_controller.dart';
import 'package:nuntium/features/out_boarding/presentaion/controller/welcome_controller.dart';
import 'package:nuntium/features/verification/presentation/controller/verification_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/splash/controller/splash_controller.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance
      .registerLazySingleton<AppSettingsSharedPreferences>(() => AppSettingsSharedPreferences(instance()));

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

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionCheckerPlus()));
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

initHome() {
  disposeWelcome();
  Get.put<HomeController>(HomeController());
}

disposeHome() {
  Get.delete<HomeController>();
}

initWelcome() {
  disposeOutBoarding();
  Get.put<WelcomeController>(WelcomeController());
}

initWelcomeModule() {
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(
      ),
    );
  }
}

disposeWelcome() {
  disposeOutBoarding();
}

initLoginModule() {
  disposeSplash();
  disposeOutBoarding();
  disposeWelcome();
  // initVerificationModule();
  // initFcmToken();

  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImplement(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(
        instance<LoginRepository>(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());
}

disposeLoginModule() {
  // disposeFcmToken();

  if (GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.unregister<RemoteLoginDataSource>();
  }

  if (GetIt.I.isRegistered<LoginRepository>()) {
    instance.unregister<LoginRepository>();
  }

  if (GetIt.I.isRegistered<LoginUseCase>()) {
    instance.unregister<LoginUseCase>();
  }

  Get.delete<LoginController>();
}

initRegisterModule() {
  disposeLoginModule();
  if (!GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.registerLazySingleton<RemoteRegisterDataSource>(
      () => RemoteRegisterDataSourceImplement(
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterRepository>()) {
    instance.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(
        instance<RemoteRegisterDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        instance<RegisterRepository>(),
      ),
    );
  }

  Get.put<RegisterController>(RegisterController());
}

disposeRegisterModule() {
  if (GetIt.I.isRegistered<RemoteRegisterDataSource>()) {
    instance.unregister<RemoteRegisterDataSource>();
  }

  if (GetIt.I.isRegistered<RegisterRepository>()) {
    instance.unregister<RegisterRepository>();
  }

  if (GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.unregister<RegisterUseCase>();
  }

  Get.delete<RegisterController>();
}

initForgetPassword() async {
  disposeLoginModule();
  // initSendOtp();

  // if (!GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
  //   instance.registerLazySingleton<ForgetPasswordDataSource>(
  //           () => RemoteForgetPasswordDataSourceImpl(instance<AppApi>()));
  // }
  //
  // if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
  //   instance.registerLazySingleton<ForgetPasswordRepository>(
  //           () => ForgetPasswordRepositoryImpl(instance(), instance()));
  // }
  //
  // if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
  //   instance.registerFactory<ForgetPasswordUseCase>(
  //           () => ForgetPasswordUseCase(instance<ForgetPasswordRepository>()));
  // }

  Get.put<ForgetPasswordController>(ForgetPasswordController());
}

disposeForgetPassword() async {
  // if (GetIt.I.isRegistered<ForgetPasswordDataSource>()) {
  //   instance.unregister<ForgetPasswordDataSource>();
  // }
  //
  // if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
  //   instance.unregister<ForgetPasswordRepository>();
  // }
  //
  // if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
  //   instance.unregister<ForgetPasswordUseCase>();
  // }
  Get.delete<ForgetPasswordController>();
}

initVerificationModule() {
  // initSendOtp();

  // if (!GetIt.I.isRegistered<RemoteVerificationDataSource>()) {
  //   instance.registerLazySingleton<RemoteVerificationDataSource>(
  //     () => RemoteVerificationDataSourceImplementation(
  //       instance<AppApi>(),
  //     ),
  //   );
  // }
  //
  // if (!GetIt.I.isRegistered<VerificationRepository>()) {
  //   instance.registerLazySingleton<VerificationRepository>(
  //     () => VerificationRepositoryImpl(
  //       instance<NetworkInfo>(),
  //       instance<RemoteVerificationDataSource>(),
  //     ),
  //   );
  // }
  //
  // if (!GetIt.I.isRegistered<VerificationUseCase>()) {
  //   instance.registerLazySingleton<VerificationUseCase>(
  //     () => VerificationUseCase(
  //       instance<VerificationRepository>(),
  //     ),
  //   );
  // }

  Get.put<VerificationController>(VerificationController());
}
