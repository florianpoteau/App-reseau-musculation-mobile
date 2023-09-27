import 'package:flutter/material.dart';
import 'package:renconsport/screen/widget/Container/containerSendMessage.dart';
import 'package:renconsport/screen/widget/Container/containerUserMessage.dart';
import 'package:renconsport/services/authToken/getToken.dart';
import 'package:renconsport/services/theme.dart';

class Messagerie extends StatelessWidget {
  const Messagerie({super.key, required this.username, this.id});
  final String username;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: CustomTheme.Colororange,
        child: Center(
            child: FutureBuilder<Map<String, dynamic>?>(
          future: GetToken.getToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data as Map<String, dynamic>?;

              final id = data != null ? data['id'] : 'Utilisateur inconnu';
              print(id);
              return ListView(
                reverse: true, // Place le contenu en bas de la vue
                padding: EdgeInsets.all(16.0),
                children: [
                  ContainerSendMessage(id: id),
                  SizedBox(
                    height: 30,
                  ),
                  ContainerUserMessage(
                    username: username,
                  ),
                ],
              );
            } else {
              return Text("Chargement...");
            }
            ;
          },
        )),
      ),
    );
  }
}
