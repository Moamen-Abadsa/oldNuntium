import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/features/auth/presentation/controller/login_controller.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/auth_view.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/footer_message.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/social_media_btn.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return authView(
            title: ManagerStrings.welcomeTitle,
            paragraph: ManagerStrings.loginParagraph,
            buttonText: ManagerStrings.signIn,
            forgotPassword: true,
            password: true,
            child: loginWidget(),
            controllers: {
              'emailController': controller.emailController,
              'passwordController': controller.passwordController,
            });
      },
    );
  }

  Column loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: ManagerHeight.h48,
        ),
        Center(
          child: Text(
            "or",
            style: getSemiBoldTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.greyPrimary),
          ),
        ),
        SizedBox(
          height: ManagerHeight.h48,
        ),
        socialButton(
          onPressed: () {},
          socialMedia: SocialMedia.Google,
        ),
        SizedBox(
          height: ManagerHeight.h32,
        ),
        socialButton(
          onPressed: () {},
          socialMedia: SocialMedia.Facebook,
        ),
        SizedBox(
          height: ManagerHeight.h50,
        ),
        footerMessage(),
      ],
    );
  }
}
