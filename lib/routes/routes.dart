import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/auth/presentation/view/login_view.dart';
import 'package:nuntium/features/auth/presentation/view/register_view.dart';
import 'package:nuntium/features/favourite/presentation/view/select_favourite_view.dart';
import 'package:nuntium/features/forget_password/presentation/view/forget_password.dart';
import 'package:nuntium/features/home/presentation/view/home_view.dart';
import 'package:nuntium/features/out_boarding/presentaion/view/out_boarding_view.dart';
import 'package:nuntium/features/out_boarding/presentaion/view/welcome_screen.dart';
import 'package:nuntium/features/splash/presentaion/view/splash_view.dart';
import 'package:nuntium/features/verification/presentation/view/verification_view.dart';

import '../config/dependency_injection.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String homeView = '/home_view';
  static const String loginView = '/login_view';
  static const String welcome = '/welcome_view';
  static const String register = '/register';
  static const String forget = '/forget';
  static const String verification = '/verification';
  static const String favourite = '/favourite';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => OutBoardingView());
      case Routes.homeView:
        initHome();
        return MaterialPageRoute(builder: (_) => const HomeView());
      // case Routes.loginView:
      //   initOutBoarding();
      //   return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.welcome:
        initWelcome();
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.loginView:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.register:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forget:
        initForgetPassword();
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.verification:
        initVerificationModule();
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case Routes.favourite:
        initSelectFavouriteModule();
        return MaterialPageRoute(builder: (_) => const SelectFavouriteView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRoutFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRoutFound),
        ),
      ),
    );
  }
}
