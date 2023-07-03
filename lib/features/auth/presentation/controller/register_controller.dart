import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/auth/domain/use_case/register_use_case.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late final RegisterUseCase _loginUseCase = instance<RegisterUseCase>();

  Future<void> register() async {
    (await _loginUseCase.execute(
      RegisterUseCaseInput(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmationPassword: confirmPasswordController.text,
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
