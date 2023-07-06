import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_icons.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/validator/validator.dart';
import 'package:nuntium/core/widgets/text_field.dart';
import 'package:nuntium/features/change_password/presentation/controller/change_password_controller.dart';

class ChangePasswordView extends StatelessWidget {
  final FieldValidator _validator = FieldValidator();

  ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ManagerStrings.termsAndConditions,
          style: getSemiBoldTextStyle(
            fontSize: ManagerFontSize.s24,
            color: ManagerColors.blackPrimary,
          ),
        ),
      ),
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) => Column(
          children: [
            myTextField(
              controller: controller.currentPasswordController,
              icon: ManagerIcons.password,
              hintText: 'Current Password',
              validator: (value) => _validator.validatePassword(value),
              keyboardType: TextInputType.text,
              isObscureText: true,
            ),
            myTextField(
              controller: controller.currentPasswordController,
              icon: ManagerIcons.password,
              hintText: ManagerStrings.newPasswordHint,
              validator: (value) => _validator.validatePassword(value),
              keyboardType: TextInputType.text,
              isObscureText: true,
            ),
            myTextField(
              controller: controller.currentPasswordController,
              icon: ManagerIcons.password,
              hintText: ManagerStrings.repeatNewPassword,
              validator: (value) => _validator.validatePassword(value),
              keyboardType: TextInputType.text,
              isObscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
