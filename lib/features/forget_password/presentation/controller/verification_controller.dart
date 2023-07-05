import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/forget_password/domain/use_case/verify_code_use_case.dart';

class VerificationController extends GetxController {
  late TextEditingController pinController;
  late final _verifyCodeUseCase = instance<VerifyCodeUseCase>();

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

  //************        auth الشغل هادا لازم يكون على برانش ال  *********************
  //TODO: Verify code استدعي هادي الميثود لما المستخدم يضغط على زر في شاشة 
  Future<void> verifyCode() async {
    (await _verifyCodeUseCase.execute(
      VerifyCodeUseCaseInput(
        verificationCode: pinController.text,
      ),
    ))
        .fold(
      // Todo: حالة الفشل
      (l) => null,
      //Todo: حالة النجاح
      (r) => null,
    );
  }
}
