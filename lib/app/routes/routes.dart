import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app/modules/home/home.dart';
import 'package:flutter_gym_app/app/modules/login/login.dart';
import 'package:flutter_gym_app/app/modules/sign_up/sign_up.dart';
import 'package:flutter_gym_app/app/splash_screen.dart';

class Routes {
  Routes._();

  static const String splashScreen = "/splash_screen";
  static const String login = "/login";
  static const String signUp = "/sign_up";
  static const String home = "/home";

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    splashScreen: (context) => const SplashScreen(),
    login: (context) => const Login(),
    signUp: (context) => const SignUp(),
    home: (context) => const Home(),
  };
}
