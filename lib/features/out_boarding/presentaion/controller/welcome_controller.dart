import 'package:get/get.dart';
import 'package:nuntium/routes/routes.dart';

class WelcomeController extends GetxController {
  void onGetStartedButtonPressed() {
    Get.offAllNamed(Routes.loginView);
  }
}
