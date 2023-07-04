class Constants {
  static const int splashDuration = 3;
  static const int containerDuration = 1;
  static const double elevationAppBar = 0;

  static const double deviceWidth = 375;
  static const double deviceHeight = 812;
  static const int codeVerificationMaxLine = 1;
}

class ConstantsPrefsKeys {
  static const String outBoardingViewedKey = 'out_boarding_viewed';
  static const String token = 'token';
  static const String tokenKey = 'token_key';
  static const String loggedIn = "loggedIn";
  static const String FavouriteViewed = "FavouriteViewed";
  static const String Registered = "Registered";
}

class FirestoreConstants {
  static const String topics = "categories";
}



class ApiConstants {
  static const String API_KEY = "0ffcced1a5c44be2b2f4984ec3b404cd";
  static const String baseUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2023-04-18&sortBy=publishedAt&apiKey=$API_KEY";
  static const String authorization = 'authorization';
  static const int sendTimeOutDuration = 120;
  static const int receiveTimeOutDuration = 120;
  static const String message = "message";
  static const String token = 'token';
  static const String status = 'status';
  static const String noInternetConnection = 'No Internet connection';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
  static const String passwordConfirmation = 'password_confirmation';
}
