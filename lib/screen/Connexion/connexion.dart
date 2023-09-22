import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/models/session.dart';
import 'package:renconsport/screen/widget/Bouton/boutonIdentificationUser.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<Token>? _futureTokens;
  bool isLoading = false;

  Future<void> _removeToken() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  @override
  void initState() {
    super.initState();

    _removeToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Utilisation d'un Stack pour superposer les éléments
        children: [
          SingleChildScrollView(
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
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 70),
                          Image.asset("assets/logo.png"),
                          SizedBox(height: 16.0),
                          InputTexte(
                            icon: Icons.person,
                            text: "Entrez votre email",
                            controller: emailController,
                            showPassword: false,
                            colorInput: Color(0xFF293548),
                            colorTexte: Colors.white,
                            type: TextInputType.text,
                            floatingLabel: FloatingLabelBehavior.auto,
                            minLength: 3,
                            maxleight: 70,
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
                            floatingLabel: FloatingLabelBehavior.auto,
                            minLength: 3,
                            maxleight: 70,
                          ),
                          SizedBox(height: 38),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonIdentificationUser(
                                onPressed: () async {
                                  // Valider le formulaire
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading =
                                          true; // Activer l'indicateur de chargement
                                      String email = emailController.text;
                                      String password = passwordController.text;
                                      _futureTokens =
                                          Service.fetchToken(email, password);
                                    });
                                    try {
                                      final tokens = await _futureTokens;
                                      print(tokens);
                                      if (tokens != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Homepage(),
                                          ),
                                        );
                                      }
                                    } catch (e) {
                                      print(e);
                                    } finally {
                                      setState(() {
                                        isLoading =
                                            false; // Désactiver l'indicateur de chargement
                                      });
                                    }
                                  }
                                },
                                texte: "Se connecter",
                              ),
                              ButtonIdentificationUser(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => Inscription()),
                                    ),
                                  );
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
          // Indicateur de chargement superposé
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5), // Fond semi-transparent
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
