import 'package:flutter/material.dart';

class CardDetailsModale extends StatelessWidget {
  final String cardTitle;
  final String cardDetails;
  final int? serie;
  final int? repetition;
  final String? note;
  final int? poids;
  final String? exerciceGenre;
  final bool? ispublic;

  CardDetailsModale(
      {required this.cardTitle,
      required this.cardDetails,
      this.serie,
      this.repetition,
      this.note,
      this.poids,
      this.exerciceGenre,
      this.ispublic});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            exerciceGenre!,
            style: TextStyle(color: Colors.black, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          if (ispublic == true)
            Text(
              "public",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          if (ispublic == false)
            Text(
              "privé",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )
        ],
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              "$cardDetails:",
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
            ),
            if (serie != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "$serie série",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            if (repetition != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "$repetition répétitions",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            if (poids != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "$poids kg",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                Text(
                  "$note",
                  style: TextStyle(color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text('Ajouter'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Groupe'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
