import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';

Widget footerMessage({
  String firstMessage = "Don't have an account? ",
  String secondMessage = "Sign Up",
  // String destination = Routes.register,
  required Function() onPressed,
}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstMessage,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.blackLighter,
              ),
            ),
            InkWell(
              onTap: onPressed,
              child: Text(
                secondMessage,
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.blackPrimary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ManagerHeight.h8,
        )
      ],
    ),
  );
}
