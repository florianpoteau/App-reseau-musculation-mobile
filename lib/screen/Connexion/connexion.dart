import 'package:flutter/material.dart';
import 'package:renconsport/screen/Connexion/inputTexte.dart';
import 'package:renconsport/services/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: CustomTheme.Colororange,
                  child: Column(
                    children: [
                      Image.asset("assets/logo.png"),
                      SizedBox(height: 16.0),
                      InputTexte(
                        icon: Icons.person,
                        text: '"Entrez votre email / pseudo"',
                      ),
                      SizedBox(height: 16),
                      InputTexte(icon: Icons.lock, text: "Entrez votre mdp")
                    ],
                  ))
            ],
          ),
        )));
  }
}
