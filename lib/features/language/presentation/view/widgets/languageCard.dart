import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_icons.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/features/language/presentation/controller/language_controller.dart';

Widget language(
    {required String language, bool isChecked = false, required int pos}) {
  return GetBuilder<LanguageController>(
    builder: (controller) => Container(
      height: ManagerHeight.h60,
      margin: EdgeInsets.only(bottom: ManagerHeight.h16),
      decoration: BoxDecoration(
          color: isChecked
              ? ManagerColors.purplePrimary
              : ManagerColors.greyLighter,
          borderRadius: BorderRadius.all(
            Radius.circular(
              ManagerRadius.r16,
            ),
          )),
      child: ListTile(
        onTap: () {
          controller.languageChecked = pos;
          controller.myUpdate();
        },
        title: Text(
          "   $language",
          style: getSemiBoldTextStyle(
            fontSize: ManagerFontSize.s16,
            color: isChecked ? ManagerColors.white : ManagerColors.greyDarker,
          ),
        ),
        trailing: Visibility(
          visible: isChecked,
          child: Icon(
            ManagerIcons.check,
            color: ManagerColors.white,
          ),
        ),
      ),
    ),
  );
}
