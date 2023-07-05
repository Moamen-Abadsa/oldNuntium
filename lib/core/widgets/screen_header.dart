import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';

Widget header({required String title, required String paragraph}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: ManagerHeight.h28,
      ),
      Text(
        title,
        style: getSemiBoldTextStyle(
            fontSize: ManagerFontSize.s24, color: ManagerColors.blackPrimary),
      ),
      SizedBox(
        height: ManagerHeight.h8,
      ),
      Text(
        paragraph,
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.greyPrimary),
      ),
      SizedBox(
        height: ManagerHeight.h32,
      ),
    ],
  );
}
