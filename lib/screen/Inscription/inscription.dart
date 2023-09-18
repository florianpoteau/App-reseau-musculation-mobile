import 'package:flutter/material.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/screen/Connexion/connexion.dart';
import 'package:renconsport/screen/widget/Bouton/boutonIdentificationUser.dart';
import 'package:renconsport/screen/widget/inputTexte.dart';
import 'package:renconsport/services/AuthRegister/authRegister.dart';
import 'package:renconsport/services/theme.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController pseudoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstPasswordController = TextEditingController();
  TextEditingController secondPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool isLoading = false;

  Future<User>? _futureUser;
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomTheme.Colorblue,
      ),
      backgroundColor: CustomTheme.Colorblue,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      key: _formKey, // Utilisez la clé pour le formulaire
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
                            floatingLabel: FloatingLabelBehavior.never,
                            minLength: 3,
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
                            floatingLabel: FloatingLabelBehavior.never,
                            minLength: 3,
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
                            floatingLabel: FloatingLabelBehavior.never,
                            minLength: 8,
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
                            floatingLabel: FloatingLabelBehavior.never,
                            minLength: 8,
                          ),
                          SizedBox(height: 25),
                          InputTexte(
                            icon: Icons.calendar_month,
                            text: "Entrez votre age",
                            controller: ageController,
                            showPassword: false,
                            colorInput: Colors.white,
                            colorTexte: Colors.black,
                            type: TextInputType.number,
                            floatingLabel: FloatingLabelBehavior.never,
                            minLength: 1,
                          ),
                          SizedBox(height: 40),
                          ButtonIdentificationUser(
                            onPressed: () async {
                              // Vérifiez d'abord si le formulaire est valide
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                  String pseudo = pseudoController.text.trim();
                                  String email = emailController.text.trim();
                                  String firstPassword =
                                      firstPasswordController.text.trim();
                                  String secondPassword =
                                      secondPasswordController.text;
                                  int age =
                                      int.parse(ageController.text.trim());

                                  if (firstPassword == secondPassword) {
                                    _futureUser = AuthRegister.postUser(
                                        pseudo, email, firstPassword, age);
                                  }
                                });

                                try {
                                  final user = await _futureUser;
                                  if (user != null) {
                                    // La requête d'inscription a réussi, naviguez vers la page de connexion
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Connexion(),
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Erreur',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          content: Text(
                                            'Les mots de passe ne correspondent pas.',
                                            style:
                                                TextStyle(color: Colors.black),
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
                                } catch (e) {
                                  print(e);
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
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
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
