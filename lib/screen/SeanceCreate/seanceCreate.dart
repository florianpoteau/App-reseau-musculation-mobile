import 'package:flutter/material.dart';

class SeanceCreate extends StatefulWidget {
  final String category;

  SeanceCreate({required this.category});

  @override
  _SeanceCreateState createState() => _SeanceCreateState();
}

class _SeanceCreateState extends State<SeanceCreate> {
  final _formKey = GlobalKey<FormState>();
  bool _isPrivate = true;
  String _selectedDuration = 'minutes';
  String _selectedWeight = 'kg';

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
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(labelText: 'Poids'),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez remplir ce champ';
                                  }

                                  if (!RegExp(r'^\d+(\.\d+)?$')
                                      .hasMatch(value)) {
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
                                groupValue: _isPrivate,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isPrivate = value!;
                                  });
                                },
                              ),
                              Text('Oui'),
                              Radio(
                                value: false,
                                groupValue: _isPrivate,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isPrivate = value!;
                                  });
                                },
                              ),
                              Text('Non'),
                            ],
                          ),
                        ],
                      ),
                      TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              labelText: 'Détails des exercices')),
                      TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(labelText: 'Notes')),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
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
