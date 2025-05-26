import 'package:flutter/material.dart';
import 'package:modernloginpage/screens/auth/login_screen.dart';
import 'package:modernloginpage/screens/auth/signup_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignUpScreen(),
  };
}