import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../features/splash/controller/splash_controller.dart';

final instance = GetIt.instance;

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  // Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  // Get.delete<OutBoardingController>();
}
