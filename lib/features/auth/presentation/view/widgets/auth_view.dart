import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_icons.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/validator/validator.dart';
import 'package:nuntium/core/widgets/rect_button.dart';
import 'package:nuntium/core/widgets/text_field.dart';
import 'package:nuntium/features/forget_password/presentation/view/widget/verification_widget.dart';
import 'package:nuntium/routes/routes.dart';

Widget authView(
    {Widget? child,
    required String title,
    required String paragraph,
    bool forgotPassword = false,
    bool password = false,
    bool confirmPassword = false,
    bool name = false,
    bool verification = false,
    required String buttonText,
    String? passwordHint,
    String? confirmPasswordHint,
    required Function() onPressed,
    required Map<String, TextEditingController> controllers}) {
  final FieldValidator _failedValidator = FieldValidator();
  final GlobalKey<FormState> _formKey = GlobalKey();
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ManagerHeight.h28,
              ),
              Text(
                title,
                style: getSemiBoldTextStyle(
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.blackPrimary),
              ),
              SizedBox(
                height: ManagerHeight.h8,
              ),
              Text(
                paragraph,
                style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.greyPrimary),
              ),
              SizedBox(
                height: ManagerHeight.h32,
              ),
              !verification
                  ? Column(
                      children: [
                        Visibility(
                          visible: name,
                          child: myTextField(
                            controller: controllers['nameController'] ??
                                TextEditingController(),
                            icon: ManagerIcons.user,
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                _failedValidator.validateFullName(value),
                          ),
                        ),
                        SizedBox(
                          height: name ? ManagerHeight.h16 : 0,
                        ),
                        myTextField(
                          controller: controllers['emailController'] ??
                              TextEditingController(),
                          icon: ManagerIcons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              _failedValidator.validateEmail(value),
                        ),
                        SizedBox(
                          height: ManagerHeight.h16,
                        ),
                        Visibility(
                          visible: password,
                          child: myTextField(
                            controller: controllers['passwordController'] ??
                                TextEditingController(),
                            icon: ManagerIcons.password,
                            keyboardType: TextInputType.text,
                            isObscureText: true,
                            hintText: passwordHint ?? "Password",
                            validator: (value) =>
                                _failedValidator.validatePassword(value),
                          ),
                        ),
                        SizedBox(
                          height: password ? ManagerHeight.h16 : 0,
                        ),
                        Visibility(
                          visible: confirmPassword,
                          child: myTextField(
                            controller:
                                controllers['confirmPasswordController'] ??
                                    TextEditingController(),
                            icon: ManagerIcons.password,
                            isObscureText: true,
                            hintText:
                                confirmPasswordHint ?? 'Repeat New Password',
                            validator: (value) =>
                                _failedValidator.validatePassword(value),
                          ),
                        ),
                        SizedBox(
                          height: confirmPassword ? ManagerHeight.h16 : 0,
                        ),
                        Visibility(
                          visible: forgotPassword,
                          child: Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () => Get.offAllNamed(Routes.forget),
                                child: Text(
                                  ManagerStrings.forgetPassword,
                                  style: getMediumTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: ManagerColors.greyPrimary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        verificationNode(),
                        SizedBox(
                          height: ManagerHeight.h16,
                        )
                      ],
                    ),
              SizedBox(
                height: forgotPassword ? ManagerHeight.h24 : 0,
              ),
              rectButton(onPressed: onPressed, text: buttonText),
              // Expanded(child: child ?? const SizedBox())
              child ?? const SizedBox()
            ],
          ),
        ),
      ),
    ),
  );
}
