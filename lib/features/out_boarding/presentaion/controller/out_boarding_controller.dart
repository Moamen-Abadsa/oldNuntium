import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/appSettingsSharedPreferences.dart';

class OutBoardingController extends GetxController {
  final AppSettingsSharedPreferences sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  @override
  void onInit() {
    super.onInit();
  }
}
