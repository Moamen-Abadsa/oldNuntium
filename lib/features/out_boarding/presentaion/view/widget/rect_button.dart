import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';

ElevatedButton rectButton(
    {required void Function() onPressed, required String text}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
          fontSize: ManagerFontSize.s16,
          color: ManagerColors.white,
          fontWeight: ManagerFontWeight.semi_bold,
          fontFamily: ManagerFontFamily.fontFamily),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: ManagerColors.purplePrimary,
      minimumSize: Size(0, ManagerHeight.h56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ManagerRadius.r12),
        ),
      ),
    ),
  );
}
