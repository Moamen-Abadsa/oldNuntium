import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/config/localization/locale_settings.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/service/theme_service.dart';
import 'package:nuntium/routes/routes.dart';

import 'config/dependency_injection.dart';

void main() async {
  await initModule();
  runApp(
    EasyLocalization(
      supportedLocales: localeSettings.supportedLocales,
      path: translationPath,
      fallbackLocale: localeSettings.defaultLocale,
      startLocale: localeSettings.defaultLocale,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;

  MyApp({super.key}) : _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(
        Constants.deviceWidth,
        Constants.deviceHeight,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.favourite,
          theme: _themeService.getThemeData(),
          themeMode: _themeService.getThemeMode(),
        );
      },
    );
  }
}
