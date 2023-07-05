import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/auth_view.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/footer_message.dart';
import 'package:nuntium/features/forget_password/presentation/controller/verification_controller.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationController>(
      init: VerificationController(),
      builder: (controller) {
        return authView(
          title: "Verification Code ✅",
          paragraph:
              "You need to enter 4-digit code we send to\n your email adress.",
          buttonText: "Confirm",
          onPressed: () {
            controller.verifyCode();
          },
          verification: true,
          controllers: {},
          child: footerMessage(
              onPressed: () {},
              firstMessage: 'Didn’t receive an email?',
              secondMessage: 'Send again'),
        );
      },
    );
  }
}
