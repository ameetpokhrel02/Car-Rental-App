import 'package:flutter/material.dart';
import 'package:modernloginpage/screens/auth/login_screen.dart';
import 'package:modernloginpage/screens/auth/signup_screen.dart';
import 'package:modernloginpage/screens/favorites_page.dart';
import 'package:modernloginpage/screens/favorites_screen.dart';
import 'package:modernloginpage/screens/initial_splash_screen.dart';
import 'package:modernloginpage/screens/splash_screen.dart';
import  'package:modernloginpage/screens/home_screen.dart';
import 'package:modernloginpage/screens/chat_screen.dart';

// Define the routes for your app
class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/initial': (context) => const InitialSplashScreen(),
    '/home': (context) => const HomeScreen(),  //
    '/favorites': (context) => const FavoritesScreen(),  //
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignUpScreen(),
    '/chat': (context) => const ChatScreen(),
  };
}