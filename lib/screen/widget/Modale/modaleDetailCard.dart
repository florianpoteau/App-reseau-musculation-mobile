import 'package:flutter/material.dart';

class CardDetailsModale extends StatelessWidget {
  final String cardTitle;
  final String cardDetails;

  CardDetailsModale({required this.cardTitle, required this.cardDetails});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(cardTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(cardDetails),
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
