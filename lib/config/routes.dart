import 'package:flutter/material.dart';
import 'package:modernloginpage/screens/auth/login_screen.dart';
import 'package:modernloginpage/screens/auth/signup_screen.dart';
import 'package:modernloginpage/screens/initial_splash_screen.dart';
import 'package:modernloginpage/screens/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/initial': (context) => const InitialSplashScreen(),
    '/': (context) => const SplashScreen(),
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignUpScreen(),
  };
}