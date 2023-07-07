import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nuntium/core/internet_checker/internet_checker.dart';
import 'package:nuntium/core/network/app_api.dart';
import 'package:nuntium/core/network/dio_factory.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/features/article/presentation/controller/article_controller.dart';
import 'package:nuntium/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:nuntium/features/auth/data/data_source/remote_register_data_source.dart';
import 'package:nuntium/features/auth/data/repository/login_repository.dart';
import 'package:nuntium/features/auth/data/repository/register_repository.dart';
import 'package:nuntium/features/auth/domain/use_case/login_use_case.dart';
import 'package:nuntium/features/auth/domain/use_case/register_use_case.dart';
import 'package:nuntium/features/auth/presentation/controller/login_controller.dart';
import 'package:nuntium/features/auth/presentation/controller/register_controller.dart';
import 'package:nuntium/features/category/presentation/controller/categories_controller.dart';
import 'package:nuntium/features/favorite_topic/data/data_source/local_favorite_topic_data_source.dart';
import 'package:nuntium/features/favorite_topic/data/data_source/remote_topics_data_source.dart';
import 'package:nuntium/features/favorite_topic/data/repository/favorite_topic_repository.dart';
import 'package:nuntium/features/favorite_topic/data/repository/topics_repository.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/select_favorite_topic_use_case.dart';
import 'package:nuntium/features/favorite_topic/domain/use_case/topics_use_case.dart';
import 'package:nuntium/features/favorite_topic/presentation/controller/select_favorite_topic_controller.dart';
import 'package:nuntium/features/forget_password/data/data_source/remote_forget_password_data_source.dart';
import 'package:nuntium/features/forget_password/data/repository/forget_password_repository.dart';
import 'package:nuntium/features/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:nuntium/features/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:nuntium/features/forget_password/presentation/controller/verification_controller.dart';
import 'package:nuntium/features/home/data/data_source/remote_home_data_source.dart';
import 'package:nuntium/features/home/data/repository/home_repository.dart';
import 'package:nuntium/features/home/domain/use_case/home_use_case.dart';
import 'package:nuntium/features/home/presentation/controller/home_controller.dart';
import 'package:nuntium/features/language/presentation/controller/language_controller.dart';
import 'package:nuntium/features/main/presentation/controller/main_controller.dart';
import 'package:nuntium/features/out_boarding/presentaion/controller/out_boarding_controller.dart';
import 'package:nuntium/features/out_boarding/presentaion/controller/welcome_controller.dart';
import 'package:nuntium/features/terms_and_conditions/presentation/controller/terms_and_conditions_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/splash/controller/splash_controller.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();

  final sharedPreferences = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
    () => AppSettingsSharedPreferences(instance()),
  );

  //why ? you dont use generic type in bellow!
  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  // what are classes you register in getIt from all the classes in the app
  instance.registerLazySingleton<AppApi>(
    () => AppApi(dio),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionCheckerPlus()),
  );
}

initSplash() {
  Get.put(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initMainModule() {
  Get.put(MainController());
  debugger();
  initHome();
  // initProfile();
}

initHome() {
  debugger();
  disposeWelcome();
  if (!GetIt.I.isRegistered<RemoteHomeDataSource>()) {
    instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeRepository>()) {
    instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImplement(
        instance<RemoteHomeDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        instance<HomeRepository>(),
      ),
    );
  }
  Get.put(HomeController());
}

disposeHome() {
  Get.delete<HomeController>();
}

initWelcome() {
  disposeOutBoarding();
  Get.put(WelcomeController());
}

initWelcomeModule() {
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
      () => RemoteLoginDataSourceImplement(),
    );
  }
}

disposeWelcome() {
  disposeOutBoarding();
  Get.delete<WelcomeController>();
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

  Get.put(LoginController());
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
      () => RemoteRegisterDataSourceImplement(),
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

  Get.put(RegisterController());
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

  if (!GetIt.I.isRegistered<RemoteForgetPasswordDataSource>()) {
    instance.registerLazySingleton<RemoteForgetPasswordDataSource>(
      () => RemoteForgetPasswordDataSourceImplement(),
    );
  }

  if (!GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepositoryImplement(
        instance<RemoteForgetPasswordDataSource>(),
        instance<NetworkInfo>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(
        instance<ForgetPasswordRepository>(),
      ),
    );
  }

  Get.put(ForgetPasswordController());
}

disposeForgetPassword() async {
  if (GetIt.I.isRegistered<RemoteForgetPasswordDataSource>()) {
    instance.unregister<RemoteForgetPasswordDataSource>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordRepository>()) {
    instance.unregister<ForgetPasswordRepository>();
  }

  if (GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.unregister<ForgetPasswordUseCase>();
  }
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

initSelectFavouriteModule() {
  // if (!GetIt.I.isRegistered<RemoteFavoriteTopicDataSource>()) {
  //   instance.registerLazySingleton<RemoteFavoriteTopicDataSource>(
  //     () => RemoteFavoriteTopicDataSourceImplement(
  //       // instance<AppApi>(),
  //     ),
  //   );
  // }

  // if (!GetIt.I.isRegistered<TopicsRepository>()) {
  //   instance.registerLazySingleton<TopicsRepository>(
  //     () => TopicsRepositoryImplement(
  //       instance<NetworkInfo>() as RemoteTopicsDataSource,
  //       // instance<RemoteVerificationDataSource>(),
  //     ),
  //   );
  // }

  // if (!GetIt.I.isRegistered<TopicsUseCase>()) {
  //   instance.registerLazySingleton<TopicsUseCase>(
  //     () => TopicsUseCase(
  //       instance<TopicsUseCase>(),
  //     ),
  //   );
  // }

  Get.put<SelectFavoriteTopicController>(SelectFavoriteTopicController());
  instance.safeRegisterLazySingleton<LocalFavoriteTopicDataSource>(
    LocalFavoriteTopicDataSourceImplement(),
  );

  instance.safeRegisterLazySingleton<FavoriteTopicRepository>(
    FavoriteTopicRepositoryImplement(
      instance<LocalFavoriteTopicDataSource>(),
      instance<NetworkInfo>(),
    ),
  );
  instance.safeRegisterLazySingleton(
    SelectFavoriteTopicUseCase(instance<FavoriteTopicRepository>()),
  );

  instance.safeRegisterLazySingleton<RemoteTopicsDataSource>(
    RemoteTopicsDataSourceImplement(),
  );

  instance.safeRegisterLazySingleton<TopicsRepository>(
    TopicsRepositoryImplement(
      instance<RemoteTopicsDataSource>(),
      instance<NetworkInfo>(),
    ),
  );

  instance.safeRegisterLazySingleton(
    TopicsUseCase(instance<TopicsRepository>()),
  );

  Get.put(SelectFavoriteTopicController());
}

initCategoreisModule() {
  Get.put<CategoriesController>(CategoriesController());
}

disposeSelectFavouriteModule() {
  Get.delete<SelectFavoriteTopicController>();
}

initTermsAndConditionsModule() {
  Get.put(TermsAndConditionsController());
}

disposeTermsAndConditionsModule() {
  Get.delete<TermsAndConditionsController>();
}

initLanguageModule() {
  Get.put(LanguageController());
}

disposeLanguageModule() {
  Get.delete<LanguageController>();
}

initArticleModule() {
  Get.put(ArticleController());
}

disposeArticleModule() {
  Get.delete<ArticleController>();
}

extension SafeDependencyInjection on GetIt {
  void safeRegisterLazySingleton<T extends Object>(T dependency) {
    if (!isRegistered<T>()) {
      registerLazySingleton<T>(() => dependency);
    } else {
      log(
        'The ${dependency.runtimeType} is Already registered !!',
        name: 'Dependency Injection:',
      );
    }
  }
}
