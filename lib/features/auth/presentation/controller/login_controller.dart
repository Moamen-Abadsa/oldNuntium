import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';
import 'package:nuntium/features/auth/domain/use_case/login_use_case.dart';
import 'package:nuntium/routes/routes.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  Future<void> login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        email: emailController.text,
        password: passwordController.text,
      ),
    ))
        .fold(
      // Todo: حالة الفشل
      (l) => {},
      //Todo: حالة النجاح
      (r) {
        _appSettingsSharedPreferences.setLoggedIn();
        if (_appSettingsSharedPreferences.getFavouriteViewed()) {
          Get.offAllNamed(Routes.homeView);
        } else {
          Get.offAllNamed(Routes.favourite);
        }
      },
    );
  }
}
