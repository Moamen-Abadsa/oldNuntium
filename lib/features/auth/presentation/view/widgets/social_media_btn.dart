import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';

Padding socialButton(
    {required void Function() onPressed,
    bool isHasMargin = false,
    required SocialMedia socialMedia}) {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: isHasMargin ? ManagerWidth.w20 : 0),
    child: ElevatedButton.icon(
      icon: socialMedia == SocialMedia.Facebook
          ? Image.asset(ManagerAssets.facebook)
          : Image.asset(ManagerAssets.google),
      onPressed: onPressed,
      label: Text(
        socialMedia == SocialMedia.Google
            ? ManagerStrings.google
            : ManagerStrings.facebook,
        style: TextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.greyDarker,
            fontWeight: ManagerFontWeight.semi_bold,
            fontFamily: ManagerFontFamily.fontFamily),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        // shadowColor: ManagerColors.white,
        surfaceTintColor: ManagerColors.white,
        minimumSize: Size(double.infinity, ManagerHeight.h56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ManagerRadius.r12),
          ),
          side: BorderSide(color: ManagerColors.greyLighter),
        ),
      ),
    ),
  );
}

enum SocialMedia { Facebook, Google }
