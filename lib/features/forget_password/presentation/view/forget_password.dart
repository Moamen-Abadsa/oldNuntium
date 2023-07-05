import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/auth_view.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/footer_message.dart';
import 'package:nuntium/features/forget_password/presentation/controller/forget_password_controller.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) {
        return authView(
          title: ManagerStrings.forget,
          paragraph: ManagerStrings.forgetParagraph,
          buttonText: ManagerStrings.next,
          onPressed: () {
            controller.forgetPassword();
          },
          child: footerMessage(
            firstMessage: ManagerStrings.forgetPasswordFooterMessage,
            secondMessage: ManagerStrings.sendAgain,
            onPressed: () {},
          ),
          controllers: {
            'emailController': controller.emailController,
          },
        );
      },
    );
  }
}
