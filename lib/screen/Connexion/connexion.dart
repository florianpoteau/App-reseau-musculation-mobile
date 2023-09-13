import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/models/session.dart';
import 'package:renconsport/screen/Messagerie/messagerie.dart';
import 'package:renconsport/screen/widget/bouton.dart';
import 'package:renconsport/screen/widget/inputTexte.dart';
import 'package:renconsport/screen/Inscription/inscription.dart';
import 'package:renconsport/services/authToken/fetchToken.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/screen/Homepage/homepage.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _HomePageState();
}

class _HomePageState extends State<Connexion> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<Token>? _futureTokens;
  final storage = new FlutterSecureStorage();

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
                child: Form(
                  child: Column(
                    children: [
                      Image.asset("assets/logo.png"),
                      SizedBox(height: 16.0),
                      InputTexte(
                        icon: Icons.person,
                        text: '"Entrez votre email / pseudo"',
                        controller: emailController,
                        showPassword: false,
                        colorInput: Color(0xFF293548),
                        colorTexte: Colors.white,
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 16),
                      InputTexte(
                        icon: Icons.lock,
                        text: "Entrez votre mdp",
                        controller: passwordController,
                        showPassword: true,
                        colorInput: Color(0xFF293548),
                        colorTexte: Colors.white,
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 38),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(
                            onPressed: () async {
                              setState(() {
                                String email = emailController.text;
                                String password = passwordController.text;
                                _futureTokens =
                                    Service.fetchToken(email, password);
                              });
                              try {
                                final tokens = await _futureTokens;
                                if (tokens != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Messagerie()));
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            texte: "Se connecter",
                          ),
                          Button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Inscription())));
                            },
                            texte: "S'inscrire",
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Text(
                        "Version Beta",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
