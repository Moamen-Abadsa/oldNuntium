import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/resorces/manager_text_theme_light.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,

    /// MAIN COLORS APP
    primaryColor: ManagerColors.purplePrimary,
    primaryColorLight: ManagerColors.purpleLight,

    // this for disabled button colors
    disabledColor: ManagerColors.greyLighter,
    splashColor: ManagerColors.purplePrimary,
    scaffoldBackgroundColor: ManagerColors.white,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.white,
      titleTextStyle: getBoldTextStyle(
        fontSize: ManagerFontSize.s24,
        color: ManagerColors.blackPrimary,
      ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLighter,
      buttonColor: ManagerColors.purplePrimary,
    ),

    textTheme: ManagerTextThemeLight(),
  );
}
