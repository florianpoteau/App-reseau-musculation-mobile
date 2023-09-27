import 'package:flutter/material.dart';
import 'package:renconsport/screen/Connexion/connexion.dart';
import 'package:renconsport/screen/Homepage/homepage.dart';
import 'package:renconsport/screen/Inscription/inscription.dart';
import 'package:renconsport/screen/Messagerie/messagerie.dart';
import 'package:renconsport/screen/Messagerie/userList.dart';
import 'package:renconsport/screen/ProfilPage/profilPage.dart';
import 'package:renconsport/screen/SeanceCreate/seanceCreate.dart';
import 'package:renconsport/screen/SeanceFiltre/creationSeanceFiltre.dart';
import 'package:renconsport/screen/seancePublic/seancePublic.dart';

class CustomRouter {
  static const String homepage = "/homepage";
  static const String connexion = "/connexion";
  static const String inscription = "/inscription";
  static const String profilPage = "/profil";
  static const String usersList = "/userslist";
  static const String creationSeanceFiltre = "/creationseance";
  static const String seancePublic = "/seancepublic";

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
      case profilPage:
        return MaterialPageRoute(builder: (context) => ProfilPage());
      case usersList:
        return MaterialPageRoute(builder: (context) => UserList());
      case creationSeanceFiltre:
        return MaterialPageRoute(builder: (context) => CreationSeanceFiltre());
      case seancePublic:
        return MaterialPageRoute(builder: (context) => SeancePublic());

      default:
        return MaterialPageRoute(
          builder: (context) => const Connexion(),
        );
    }
  }
}
