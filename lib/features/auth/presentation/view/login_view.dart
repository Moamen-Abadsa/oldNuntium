import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/widgets/rect_button.dart';
import 'package:nuntium/core/widgets/text_field.dart';
import 'package:nuntium/features/auth/presentation/view/widgets/social_media_btn.dart';
import 'package:nuntium/routes/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ManagerHeight.h28,
              ),
              Text(
                ManagerStrings.welcomeParagraph,
                style: getSemiBoldTextStyle(
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.blackPrimary),
              ),
              SizedBox(
                height: ManagerHeight.h8,
              ),
              Text(
                ManagerStrings.loginParagraph,
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.greyPrimary),
              ),
              SizedBox(
                height: ManagerHeight.h32,
              ),
              myTextField(
                controller: emailController,
                icon: Icons.email_outlined,
              ),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              myTextField(
                  controller: passwordController,
                  icon: Icons.lock,
                  hintText: "Password"),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    "Forgot Password?",
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.greyPrimary),
                  ),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              rectButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.register);
                  },
                  text: "Sign In"),
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
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.blackLighter,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.blackPrimary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Perform action when "Sign Up" is clicked
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
