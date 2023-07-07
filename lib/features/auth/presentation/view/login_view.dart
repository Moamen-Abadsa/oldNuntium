import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/auth/presentation/controller/login_controller.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/auth_view.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: authView(
              title: ManagerStrings.welcomeTitle,
              paragraph: ManagerStrings.loginParagraph,
              buttonText: ManagerStrings.signIn,
              forgotPassword: true,
              password: true,
              onPressed: () => controller.login(),
              child: loginWidget(),
              controllers: {
                'emailController': controller.emailController,
                'passwordController': controller.passwordController,
              }),
        );
      },
    );
  }
}
