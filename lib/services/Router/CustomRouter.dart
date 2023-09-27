import 'package:flutter/material.dart';
import 'package:renconsport/screen/Connexion/connexion.dart';
import 'package:renconsport/screen/Homepage/homepage.dart';
import 'package:renconsport/screen/Inscription/inscription.dart';

class CustomRouter {
  static const String homepage = "/homepage";
  static const String connexion = "/connexion";
  static const String inscription = "/inscription";

  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (context) => Homepage(),
        );
      case connexion:
        return MaterialPageRoute(
          builder: (context) => Connexion(),
        );
      case inscription:
        return MaterialPageRoute(builder: (context) => Inscription());
      default:
        return MaterialPageRoute(
          builder: (context) => const Connexion(),
        );
    }
  }
}
