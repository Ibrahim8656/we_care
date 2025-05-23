import 'package:flutter/material.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/auth/presintation/screens/Login_screen.dart';
import 'package:we_care/features/auth/presintation/screens/Register_screen.dart';
import 'package:we_care/features/patient/presintation/screens/appointmentscreen.dart';
import 'package:we_care/features/patient/presintation/screens/home_layout.dart';
import 'package:we_care/features/patient/presintation/screens/homevisitScreen.dart';
import 'package:we_care/features/patient/presintation/screens/locationscreen.dart';
import 'package:we_care/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  HomeLayout());
      case '/Login':
      return MaterialPageRoute(
                              builder: (context) =>  LoginScreen());
      case '/Register':
      return MaterialPageRoute(
                              builder: (context) => const Registerscreen());
      case '/PatientHomeScreen':
      return MaterialPageRoute(
                              builder: (context) =>  HomeLayout());
      case '/appointment_screen':
  final patientEntity = settings.arguments as PatientEntitiy?;

return MaterialPageRoute(
  builder: (_) => appointment_screen(patientEntitiy: patientEntity!),
);
case '/homevisit_screen':
  final patientEntity = settings.arguments as PatientEntitiy?;

return MaterialPageRoute(
  builder: (_) => Homevisitscreen(patientEntitiy: patientEntity!, address: "Select your location",),
);
case "/location":
  final patientEntity = settings.arguments as PatientEntitiy?;

return MaterialPageRoute(
  builder: (_) => LocationScreen(patientEntitiy: patientEntity!),
);
}
    return null;
  }
  }