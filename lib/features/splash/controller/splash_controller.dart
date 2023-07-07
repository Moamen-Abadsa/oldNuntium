import 'dart:developer';

import 'package:get/get.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/routes/routes.dart';

class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences = instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(
        seconds: Constants.splashDuration,
      ),
      () {
        ///if the OutBoarding is viewd
        if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
          debugger();
          if (_appSettingsSharedPreferences.loggedIn()) {
            debugger();

            ///if User is loggedIn
            Get.offAllNamed(Routes.mainView);

            ///if User is NOT loggedIn
          } else {
            Get.offAllNamed(Routes.loginView);
          }

          ///if the OutBoarding is NOT viewd
        } else {
          Get.offAllNamed(Routes.outBoardingView);
        }
        Get.offAllNamed(Routes.outBoardingView);
      },
    );
  }
}
