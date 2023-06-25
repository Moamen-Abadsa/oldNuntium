import 'package:get/get.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/appSettingsSharedPreferences.dart';
import 'package:nuntium/routes/routes.dart';

class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
        if (_appSettingsSharedPreferences.loggedIn()) {
          Get.offAllNamed(Routes.homeView);
        } else {
          Get.offAllNamed(Routes.loginView);
        }
      } else {
        Get.offAllNamed(Routes.outBoardingView);
      }
      Get.offAllNamed(
        Routes.outBoardingView,
      );
    });
  }
}
