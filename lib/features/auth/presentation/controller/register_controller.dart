import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/features/auth/domain/use_case/register_use_case.dart';
import 'package:nuntium/routes/routes.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late final RegisterUseCase _loginUseCase = instance<RegisterUseCase>();

  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

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
      (l) => () {},
      //Todo: حالة النجاح
      (r) {
        _appSettingsSharedPreferences.setRegisterd();
        Get.offAllNamed(Routes.loginView);
      },
    );
  }
}
