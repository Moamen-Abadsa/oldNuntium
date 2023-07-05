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

  Future<void> setName(String name) async {
    await _preferences.setString("name", name);
  }

  Future<void> setEmail(String email) async {
    await _preferences.setString("email", email);
  }

  String getName() {
    return _preferences.getString("name").onNull();
  }

  String getEmail() {
    return _preferences.getString("email").onNull();
  }

  Future<void> setNotification(bool isNotificationOn) async {
    await _preferences.setBool("Notification", isNotificationOn);
  }

  bool getNotification() {
    return _preferences.getBool("Notification").onNull();
  }

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
