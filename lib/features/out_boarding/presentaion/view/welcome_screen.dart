import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/widgets/rect_button.dart';
import 'package:nuntium/features/out_boarding/presentaion/controller/welcome_controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: ManagerHeight.h90,
            ),
            Image.asset(
              ManagerAssets.illustration,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: ManagerHeight.h120,
            ),
            Text(
              ManagerStrings.appName,
              style: getBoldTextStyle(fontSize: ManagerFontSize.s35, color: ManagerColors.blackPrimary),
            ),
            SizedBox(
              height: ManagerHeight.h24,
            ),
            Text(
              textAlign: TextAlign.center,
              ManagerStrings.paragraph,
              style: getRegularTextStyle(fontSize: 16, color: ManagerColors.greyPrimary),
            ),
            SizedBox(
              height: ManagerHeight.h64,
            ),
            rectButton(
              onPressed: controller.onGetStartedButtonPressed,
              text: ManagerStrings.getStarted,
              isHasMargin: true,
            )
          ],
        ),
      ),
    );
  }
}
