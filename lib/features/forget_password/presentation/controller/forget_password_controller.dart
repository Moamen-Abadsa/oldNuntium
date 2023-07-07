import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/forget_password/domain/use_case/forget_password_use_case.dart';
import 'package:nuntium/routes/routes.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final _forgetPasswordUseCase = instance<ForgetPasswordUseCase>();

  Future<void> forgetPassword() async {
    (await _forgetPasswordUseCase.execute(
      ForgetPasswordUseCaseInput(
        email: emailController.text,
      ),
    ))
        .fold(
      (l) => {
        Get.rawSnackbar(message: l.message),
      },
      (r) => {Get.offAllNamed(Routes.verify_code)},
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
