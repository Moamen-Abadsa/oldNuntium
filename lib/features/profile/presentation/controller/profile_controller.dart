import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/routes/routes.dart';

class ProfileController extends GetxController {
  late String name;
  late String email;
  late bool isNotificationOn;
  late ImageProvider userImage;

  final _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  void setIsNotificationOn(bool value) {
    isNotificationOn = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    //Todo: get user data from storage
    // I've done!
    // name = _appSettingsSharedPreferences.getName();
    // email = _appSettingsSharedPreferences.getEmail();
    // isNotificationOn = _appSettingsSharedPreferences.getNotification();

    userImage = const AssetImage('assets/images/user_image.png');
  }

  changePassword() {}

  privacy() {}

  termsAndConditions() {
    //Todo: go to terms and conditions screen
    Get.offAllNamed(Routes.termsAndConditions);
  }

  signout() {}

  language() {
    //Todo: go to language screen
    Get.offAllNamed(Routes.language);
  }

  notification() {
    setIsNotificationOn(!isNotificationOn);
  }
}
