import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/models/session.dart';
import 'package:renconsport/screen/Connexion/inputTexte.dart';
import 'package:renconsport/services/authToken/fetchToken.dart';
import 'package:renconsport/services/theme.dart';
import 'package:renconsport/screen/Homepage/homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      ),
                      SizedBox(height: 16),
                      InputTexte(
                        icon: Icons.lock,
                        text: "Entrez votre mdp",
                        controller: passwordController,
                        showPassword: true,
                      ),
                      SizedBox(height: 38),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
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
                                          builder: (context) => HomepageH()));
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Se connecter",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "S'inscrire",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
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
