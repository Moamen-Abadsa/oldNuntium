import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  late TextEditingController pinController;

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
