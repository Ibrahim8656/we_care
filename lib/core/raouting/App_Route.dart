import 'package:flutter/material.dart';
import 'package:we_care/features/auth/presintation/screens/Login_screen.dart';
import 'package:we_care/features/auth/presintation/screens/Register_screen.dart';
import 'package:we_care/features/patient/presintation/screens/home_layout.dart';
import 'package:we_care/features/patient/presintation/screens/patient_home_screen.dart';
import 'package:we_care/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/Login':
      return MaterialPageRoute(
                              builder: (context) =>  LoginScreen());
      case '/Register':
      return MaterialPageRoute(
                              builder: (context) => const Registerscreen());
      case '/PatientHomeScreen':
      return MaterialPageRoute(
                              builder: (context) => const HomeLayout());
}
    return null;
  }
  }