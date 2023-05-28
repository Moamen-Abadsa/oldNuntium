import 'package:nuntium/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _preferences;

  AppSettingsSharedPreferences(this._preferences);

  Future<void> setOutBoardingViewed() async {
    await _preferences.setBool("out_boarding_viewed", true);
  }

  bool getOutBoadringViewed() {
    return _preferences.getBool("out_boarding_viewed").onNull();
  }
}
