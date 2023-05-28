import 'package:flutter/material.dart';
import 'package:nuntium/core/theme/manager_light_theme.dart';

class ThemeService {
  ThemeMode getThemeMode() => ThemeMode.light;

  ThemeData getThemeData() => managerLightThemeData();
}
