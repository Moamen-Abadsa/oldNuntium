import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/config/dependency_injection.dart';
import 'package:nuntium/config/localization/locale_settings.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';

class LanguageController extends GetxController {
  int languageChecked = 1;

  bool isChecked(int pos) {
    return languageChecked == pos;
  }

  myUpdate() {
    update();
  }

  final AppSettingsSharedPreferences _appSettingsSharedPreferences = instance<AppSettingsSharedPreferences>();
  final languageList = LocaleSettings.languages;

  String get currentLanguage => _appSettingsSharedPreferences.locale;

  Future<void> changeLanguage({
    required BuildContext context,
    required String langCode,
  }) async {
    _appSettingsSharedPreferences.setLocale(langCode);
    await EasyLocalization.of(context)!.setLocale(Locale(langCode));
    Get.updateLocale(Locale(langCode));
    update();
  }
}
