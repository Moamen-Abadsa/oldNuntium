import 'package:get/get.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      Get.offAllNamed(
        Routes.outBoardingView,
      );
    });
  }
}
