import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/features/auth/domain/use_case/login_use_case.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(
        email: email.text,
        password: password.text,
      ),
    ))
        .fold(
      (l) => null,
      (r) => null,
    );
  }
}
