import 'package:flutter/material.dart';
import 'package:renconsport/models/exercice.dart';
import 'package:renconsport/screen/Homepage/homepage.dart';
import 'package:renconsport/services/Entrainements/postEntrainement.dart';
import 'package:renconsport/services/Router/CustomRouter.dart';

class SeanceCreate extends StatefulWidget {
  final String category;
  final Exercice? selectedExercice;
  final int exerciceid;

  SeanceCreate(
      {required this.category,
      this.selectedExercice,
      required this.exerciceid});

  @override
  _SeanceCreateState createState() => _SeanceCreateState();
}

class _SeanceCreateState extends State<SeanceCreate> {
  final _formKey = GlobalKey<FormState>();
  bool _isPrivate = true;
  String _selectedDuration = 'minutes';
  String _selectedWeight = 'kg';

  // Controller
  TextEditingController nom = TextEditingController();
  TextEditingController serie = TextEditingController();
  TextEditingController repetition = TextEditingController();
  TextEditingController poids = TextEditingController();
  TextEditingController duree = TextEditingController();
  ValueNotifier<bool> isPrivateValue = ValueNotifier<bool>(true);

  TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF293548),
          toolbarHeight: 100.0,
          title: Text(
            'Création de la Séance',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        body: Container(
            color: _getBodyColor(),
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: nom,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(labelText: 'Exercices'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: serie,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(labelText: 'Séries'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: repetition,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(labelText: 'Répétitions'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                      if (_shouldShowPoidsField())
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: poids,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(labelText: 'Poids'),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (_shouldShowPoidsField() &&
                                      (value == null || value.isEmpty)) {
                                    return 'Veuillez remplir ce champ';
                                  }

                                  if (!RegExp(r'^\d+(\.\d+)?$')
                                      .hasMatch(value ?? '')) {
                                    return 'Veuillez entrer un nombre valide';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: _selectedWeight,
                              items: ['kg', 'lb']
                                  .map((String value) =>
                                      DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedWeight = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(labelText: 'Adresse'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: duree,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(labelText: 'Durées'),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez remplir ce champ';
                                }

                                if (!RegExp(r'^\d+$').hasMatch(value)) {
                                  return 'Veuillez entrer un nombre entier valide';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          DropdownButton<String>(
                            value: _selectedDuration,
                            items: ['minutes', 'heure(s)']
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedDuration = newValue!;
                              });
                            },
                            iconEnabledColor: Colors.black,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Privé ?'),
                          Row(
                            children: [
                              Radio(
                                value: true,
                                groupValue: isPrivateValue.value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isPrivateValue.value = value ?? false;
                                  });
                                },
                              ),
                              Text('Oui'),
                              Radio(
                                value: false,
                                groupValue: isPrivateValue.value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isPrivateValue.value = value ?? true;
                                  });
                                },
                              ),
                              Text('Non'),
                            ],
                          ),
                        ],
                      ),
                      TextFormField(
                          controller: note,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(labelText: 'Notes')),
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String nomValue = nom.text;
                            int serieValue = int.parse(serie.text);
                            int repetitionValue = int.parse(repetition.text);
                            int poidsValue;
                            if (_shouldShowPoidsField() &&
                                poids.text.isNotEmpty) {
                              poidsValue = int.parse(poids.text);
                            } else {
                              poidsValue =
                                  0; // Ou une autre valeur par défaut appropriée
                            }

                            int dureeValue = int.parse(duree.text);
                            bool isPrivate = !isPrivateValue.value;

                            // Pour vérifier si c'est des minutes ou des heures
                            String selectedDuration = _selectedDuration;
                            String noteValue = note.text;

                            try {
                              await PostEntrainement.postEntrainement(
                                nomValue,
                                serieValue,
                                repetitionValue,
                                poidsValue,
                                dureeValue,
                                isPrivate,
                                noteValue,
                                widget.exerciceid,
                                selectedDuration,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Séance créée avec succès'),
                                ),
                              );

                              Navigator.of(context)
                                  .pushNamed(CustomRouter.homepage);
                              nom.clear();
                              serie.clear();
                              repetition.clear();
                              poids.clear();
                              duree.clear();
                              note.clear();
                            } catch (e, stackTrace) {
                              print(
                                  'Erreur lors de la création de la séance : $e');
                              print("stacktrace: $stackTrace");
                            }
                          }
                        },
                        child: Text('Créer la séance'),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  Color _getBodyColor() {
    switch (widget.category) {
      case 'Musculation':
        return Color.fromARGB(157, 255, 82, 82);
      case 'Athlétisme':
        return Colors.cyanAccent;
      case 'Natation':
        return Colors.blueAccent;
      case 'Football':
        return Colors.green;
      case 'Basket-ball':
        return Color.fromARGB(143, 189, 48, 214);
      case 'Tennis':
        return Colors.yellow;
      case 'Cyclisme':
        return Color.fromARGB(157, 255, 82, 82);
      case 'Arts martiaux':
        return Colors.amber;
      case 'Yoga':
        return Colors.brown;
      case 'Danse':
        return Colors.grey;
      case 'Autres':
        return Colors.pink;
      default:
        return Colors.white;
    }
  }

  bool _shouldShowPoidsField() {
    return widget.category == 'Musculation' ||
        widget.category == 'Cyclisme' ||
        widget.category == 'Autres';
  }
}
