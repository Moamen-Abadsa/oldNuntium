import 'package:nuntium/config/constants.dart';
import 'package:nuntium/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _preferences;

  AppSettingsSharedPreferences(this._preferences);

  Future<void> setOutBoardingViewed() async {
    await _preferences.setBool(ConstantsPrefsKeys.outBoardingViewedKey, true);
  }

  bool getOutBoardingViewed() {
    return _preferences.getBool(ConstantsPrefsKeys.outBoardingViewedKey).onNull();
  }

  //----------------------------------------------------------------------------

  String get locale => _preferences.getString(ConstantsPrefsKeys.locale).parseToLocale();

  Future<void> setLocale(String locale) async {
    await _preferences.setString(ConstantsPrefsKeys.locale, locale);
  }

  Future<void> setName(String name) async {
    await _preferences.setString(ConstantsPrefsKeys.name, name);
  }

  String getName() {
    return _preferences.getString(ConstantsPrefsKeys.name).onNull();
  }

  Future<void> setEmail(String email) async {
    await _preferences.setString(ConstantsPrefsKeys.email, email);
  }

  String getEmail() {
    return _preferences.getString(ConstantsPrefsKeys.email).onNull();
  }

  Future<void> clear() async {
   await _preferences.clear();
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

  Future<void> setTopicsSelected(NewsTopics topic, bool isChecked) async {
    _preferences.setBool(topic.toString(), isChecked);
  }

  bool getTopicSelected(NewsTopics topic) {
    return _preferences.getBool(topic.toString()).onNull();
  }
}

enum NewsTopics {
  Sports,
  Politics,
  Life,
  Gaming,
  Animals,
  Nature,
  Food,
  Art,
  History,
  Fashion,
  Covid_19,
  Middle_East,
  none
}
