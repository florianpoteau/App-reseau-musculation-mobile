import 'package:flutter/material.dart';
import 'package:renconsport/screen/Messagerie/messagerie.dart';
import 'package:renconsport/services/Router/CustomRouter.dart';

class ModalUser extends StatelessWidget {
  final String username;
  final int age;
  final int? id;

  const ModalUser(
      {Key? key, required this.username, required this.age, this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        username,
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        "$age ans",
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text("Contacter"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Messagerie(username: username, id: id)));
              },
            ),
            TextButton(
              child: Text("Fermer"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }
}
