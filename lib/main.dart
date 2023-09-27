import 'package:flutter/material.dart';
import 'package:renconsport/screen/Connexion/connexion.dart';
import 'package:renconsport/screen/Homepage/homepage.dart';
import 'package:renconsport/services/Router/CustomRouter.dart';
import 'package:renconsport/services/authToken/getToken.dart';
import 'package:renconsport/services/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Utilisez la fonction getToken() pour vérifier la présence d'un token
    return FutureBuilder<Map<String, dynamic>?>(
      future: GetToken.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Si un token est présent, affichez la page d'accueil, sinon affichez la page de connexion
          final hasToken = snapshot.hasData && snapshot.data != null;
          final initialRoute =
              hasToken ? CustomRouter.homepage : CustomRouter.connexion;

          return MaterialApp(
            title: "RenconSport",
            onGenerateRoute: CustomRouter.router,
            initialRoute: initialRoute,
            home: hasToken ? Homepage() : Connexion(),
            theme: CustomTheme.defaultTheme,
          );
        } else {
          // Pendant le chargement, vous pouvez afficher un écran de chargement ou autre chose si nécessaire
          return CircularProgressIndicator();
        }
      },
    );
  }
}
