import 'package:flutter/material.dart';

class ModalEntrainement extends StatelessWidget {
  final int? idEntrainement;
  const ModalEntrainement({super.key, this.idEntrainement});

  @override
  Widget build(BuildContext context) {
    TextEditingController nouveauNom = TextEditingController();
    print(idEntrainement);
    return AlertDialog(
      title: Text(
        "Modifier l'entraînement",
        style: TextStyle(color: Colors.black),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Saisissez un nouveau titre",
            style: TextStyle(color: Colors.black),
          ),
          TextField(
            controller: nouveauNom,
          ),
        ],
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
            // Utilisez "nouveauNom" ici pour effectuer la mise à jour
            Navigator.of(context).pop(); // Fermez la boîte de dialogue
          },
        ),
      ],
    );
    ;
  }
}
