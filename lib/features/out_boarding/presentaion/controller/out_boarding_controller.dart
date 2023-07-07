import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';

class OutBoardingController extends GetxController {
  final AppSettingsSharedPreferences sharedPreferences = instance<AppSettingsSharedPreferences>();

  @override
  void onReady() {
    super.onReady();

    sharedPreferences.setOutBoardingViewed();
  }
}
