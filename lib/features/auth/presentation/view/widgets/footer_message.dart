import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/routes/routes.dart';

Widget footerMessage(
    {String firstMessage = "Don't have an account? ",
    String secondMessage = "Sign Up",
    String destination = Routes.register}) {
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
              onTap: () => Get.offAllNamed(destination),
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
