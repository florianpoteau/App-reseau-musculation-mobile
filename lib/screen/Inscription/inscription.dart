import 'package:flutter/material.dart';
import 'package:renconsport/screen/Connexion/connexion.dart';
import 'package:renconsport/screen/widget/bouton.dart';
import 'package:renconsport/screen/widget/inputTexte.dart';
import 'package:renconsport/services/theme.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController pseudoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstPasswordController = TextEditingController();
  TextEditingController secondPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomTheme.Colorblue,
      ),
      backgroundColor: CustomTheme.Colorblue,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'Inscription',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(height: 90),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  child: Column(
                    children: [
                      InputTexte(
                        controller: pseudoController,
                        icon: Icons.person,
                        showPassword: false,
                        text: "Entrez votre pseudo",
                        colorInput: Colors.white,
                        colorTexte: Colors.black,
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      InputTexte(
                        icon: Icons.email,
                        text: "Entrez votre email",
                        controller: emailController,
                        showPassword: false,
                        colorInput: Colors.white,
                        colorTexte: Colors.black,
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      InputTexte(
                        icon: Icons.lock,
                        text: "Entrez votre mot de passe",
                        controller: firstPasswordController,
                        showPassword: true,
                        colorInput: Colors.white,
                        colorTexte: Colors.black,
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      InputTexte(
                        icon: Icons.lock,
                        text: "Confirmez votre mot de passe",
                        controller: secondPasswordController,
                        showPassword: true,
                        colorInput: Colors.white,
                        colorTexte: Colors.black,
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 25),
                      InputTexte(
                          icon: Icons.calendar_month,
                          text: "Entrez votre age",
                          controller: ageController,
                          showPassword: false,
                          colorInput: Colors.white,
                          colorTexte: Colors.black,
                          type: TextInputType.number),
                      SizedBox(height: 40),
                      Button(
                        onPressed: () async {
                          String pseudo = pseudoController.text;
                          String email = emailController.text;
                          String firstPassword = firstPasswordController.text;
                          String secondPassword = secondPasswordController.text;

                          // Mot de passe qui corresponde:
                          if (firstPassword == secondPassword) {
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Connexion())),
                              );
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            // mots de passe qui corresponde pas:
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Erreur',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  content: Text(
                                    'Les mots de passe ne correspondent pas.',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        texte: "Inscription",
                      )
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
