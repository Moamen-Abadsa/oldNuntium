import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.purpleDarker,
  );
}
