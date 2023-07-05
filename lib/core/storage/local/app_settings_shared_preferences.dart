import 'package:nuntium/config/constants.dart';
import 'package:nuntium/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _preferences;

  AppSettingsSharedPreferences(this._preferences);

  Future<void> setOutBoardingViewed() async {
    await _preferences.setBool("out_boarding_viewed", true);
  }

  bool getOutBoardingViewed() {
    return _preferences
        .getBool(
          ConstantsPrefsKeys.outBoardingViewedKey,
        )
        .onNull();
  }

  //----------------------------------------------------------------------------

  Future<void> setToken(String token) async {
    await _preferences.setString(ConstantsPrefsKeys.tokenKey, token);
  }

  String getToken() {
    return _preferences.getString(ConstantsPrefsKeys.tokenKey).onNull();
  }

  void clear() {
    _preferences.clear();
  }

  Future<void> setLoggedIn() async {
    await _preferences.setBool(ConstantsPrefsKeys.loggedIn, true);
  }

  bool loggedIn() {
    return _preferences.getBool(ConstantsPrefsKeys.loggedIn).onNull();
  }

  Future<void> setFavouriteViewed() {
    return _preferences.setBool(ConstantsPrefsKeys.FavouriteViewed, true);
  }

  bool getFavouriteViewed() {
    return _preferences.getBool(ConstantsPrefsKeys.FavouriteViewed).onNull();
  }

  Future<void> setRegisterd() async {
    await _preferences.setBool(ConstantsPrefsKeys.Registered, true);
  }

  Future<void> getRegistered() async {
    await _preferences.getBool(ConstantsPrefsKeys.Registered).onNull();

  }
}
