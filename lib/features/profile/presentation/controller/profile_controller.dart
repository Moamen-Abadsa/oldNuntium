import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late String name;
  late String email;
  late bool isNotificationOn;
  late ImageProvider userImage;

  void setIsNotificationOn(bool value) {
    isNotificationOn = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    //Todo: get user data from storage
    name = 'Eren Turkmen';
    email = 'ertuken@gmail.com';
    isNotificationOn = false;

    userImage = const AssetImage('assets/images/user_image.png');
  }

  changePassword() {}

  privacy() {}

  termsAndConditions() {
    //Todo: go to terms and conditions screen
  }

  signout() {}

  language() {
    //Todo: go to language screen
  }

  notification() {
    setIsNotificationOn(!isNotificationOn);
  }
}
