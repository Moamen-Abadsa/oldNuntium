import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/auth/presentation/controller/register_controller.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/auth_view.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/footer_message.dart';
import 'package:nuntium/routes/routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        return authView(
          title: ManagerStrings.signUpTitle,
          paragraph: ManagerStrings.signUpParagraph,
          buttonText: ManagerStrings.signUp,
          password: true,
          confirmPassword: true,
          name: true,
          onPressed: () => Get.offAllNamed(Routes.loginView),
          child: footerMessage(
              onPressed: () => Get.offAllNamed(Routes.loginView),
              firstMessage: ManagerStrings.signUpFooterMessage,
              secondMessage: ManagerStrings.signIn),
          controllers: {
            'passwordController': controller.passwordController,
            'emailController': controller.emailController,
            'nameController': controller.nameController,
            'confirmPasswordController': controller.confirmPasswordController,
          },
        );
      },
    );
  }
}
