import 'package:flutter/material.dart';
import 'package:renconsport/services/Entrainements/fetchEntrainement.dart';
import 'package:renconsport/services/Router/CustomRouter.dart';

class ModalEntrainement extends StatelessWidget {
  final int? idEntrainement;
  final int? serie;
  final int? repetition;
  final int? poids;
  const ModalEntrainement(
      {super.key,
      this.idEntrainement,
      this.serie,
      this.repetition,
      this.poids});

  @override
  Widget build(BuildContext context) {
    TextEditingController nouveauNom = TextEditingController();
    TextEditingController nouvelleNote = TextEditingController();
    TextEditingController nouvelleSerie = TextEditingController();
    TextEditingController nouvelleRepetition = TextEditingController();
    TextEditingController nouveauPoids = TextEditingController();
    return AlertDialog(
      title: Text(
        "Modifier l'entraînement",
        style: TextStyle(color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: nouveauNom,
              decoration: InputDecoration(
                labelText: 'Nouveau titre',
                labelStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            if (serie != 0)
              TextFormField(
                controller: nouvelleSerie,
                decoration: InputDecoration(
                  labelText: 'Saisissez de nouvelles serie',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
            if (repetition != 0)
              TextFormField(
                controller: nouvelleRepetition,
                decoration: InputDecoration(
                  labelText: 'Saisissez de nouvelles répétitions',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
            if (poids != 0)
              TextFormField(
                controller: nouveauPoids,
                decoration: InputDecoration(
                  labelText: 'Saisissez de nouveaux poids',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
            TextFormField(
              controller: nouvelleNote,
              decoration: InputDecoration(
                labelText: 'Saisissez de nouvelles notes',
                labelStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text("Annuler"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("Enregistrer"),
          onPressed: () {
            FetchEntrainement.putEntrainement(
                nouveauNom.text,
                nouvelleNote.text,
                nouvelleSerie.text.isNotEmpty
                    ? int.tryParse(nouvelleSerie.text)
                    : null,
                nouvelleRepetition.text.isNotEmpty
                    ? int.tryParse(nouvelleRepetition.text)
                    : null,
                nouveauPoids.text.isNotEmpty
                    ? int.tryParse(nouveauPoids.text)
                    : null,
                idEntrainement!);
            Navigator.pushNamed(context, CustomRouter.homepage);
          },
        ),
      ],
    );
  }
}
