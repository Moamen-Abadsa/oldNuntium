import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/features/forget_password/presentation/controller/verification_controller.dart';
import 'package:pinput/pinput.dart';

Widget verificationNode() {
  final defaultPinTheme = PinTheme(
    width: ManagerWidth.w72,
    height: ManagerHeight.h72,
    margin: EdgeInsetsDirectional.only(
        end: ManagerWidth.w6, start: ManagerWidth.w4),
    textStyle: getSemiBoldTextStyle(
        fontSize: ManagerFontSize.s16, color: ManagerColors.blackPrimary),
    decoration: BoxDecoration(
        // border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(ManagerRadius.r16),
        color: ManagerColors.greyLighter),
  );
  final focusNode = FocusNode();
  return GetBuilder<VerificationController>(
    builder: (controller) => Pinput(
      controller: controller.pinController,
      focusNode: focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      defaultPinTheme: defaultPinTheme,
      validator: (value) {
        return value == '2222' ? null : 'Pin is incorrect';
      },
      // onClipboardFound: (value) {
      //   debugPrint('onClipboardFound: $value');
      //   pinController.setText(value);
      // },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: ManagerColors.purplePrimary,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: ManagerColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ManagerColors.purplePrimary),
        ),
        textStyle: getSemiBoldTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.purplePrimary),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    ),
  );
}
