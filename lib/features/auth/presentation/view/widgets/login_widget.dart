import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resorces/manager_colors.dart';
import '../../../../../core/resorces/manager_fonts.dart';
import '../../../../../core/resorces/manager_sizes.dart';
import '../../../../../core/resorces/manager_styles.dart';
import '../../../../../routes/routes.dart';
import 'footer_message.dart';
import 'social_media_btn.dart';

Widget loginWidget() {
  return Expanded(
    child: Column(
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
          height: ManagerHeight.h16,
        ),
        socialButton(
          onPressed: () {},
          socialMedia: SocialMedia.Facebook,
        ),
        SizedBox(
          height: ManagerHeight.h50,
        ),
        footerMessage(
            onPressed: () => Get.offAllNamed(
                  Routes.register,
                )),
      ],
    ),
  );
}
