import 'package:flutter/material.dart';

class CardDetailsModale extends StatelessWidget {
  final String cardTitle;
  final String cardDetails;
  final int? serie;
  final int? repetition;
  final String? note;

  CardDetailsModale(
      {required this.cardTitle,
      required this.cardDetails,
      this.serie,
      this.repetition,
      this.note});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        cardTitle,
        style: TextStyle(color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              cardDetails,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "$serie séries",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "$repetition repetitions",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
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
        TextButton(
          child: Text('Fermer'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
