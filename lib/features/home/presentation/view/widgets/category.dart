import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/features/home/presentation/controller/home_controller.dart';

Widget category({
  required String text,
  required bool isChecked,
  double? margin,
}) {
  return GetBuilder<HomeController>(
    builder: (controller) => Row(
      children: [
        InkWell(
          onTap: () {
            isChecked = controller.changeColor(isChecked: isChecked);
          },
          child: Container(
            height: ManagerHeight.h32,
            width: ManagerWidth.w81,
            decoration: BoxDecoration(
              color: isChecked
                  ? ManagerColors.purplePrimary
                  : ManagerColors.greyLighter,
              borderRadius: BorderRadius.all(
                Radius.circular(ManagerRadius.r16),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: getSemiBoldTextStyle(
                  fontSize: ManagerFontSize.s12,
                  color: isChecked
                      ? ManagerColors.white
                      : ManagerColors.greyPrimary,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: margin ?? ManagerHeight.h16,
        )
      ],
    ),
  );
}
