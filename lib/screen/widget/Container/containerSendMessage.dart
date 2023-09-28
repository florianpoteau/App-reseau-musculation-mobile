import 'package:flutter/material.dart';
import 'package:renconsport/screen/widget/Container/containerUserMessage.dart';
import 'package:renconsport/services/Messagerie/fetchMessagerie.dart';
import 'package:renconsport/services/theme.dart';

class ContainerSendMessage extends StatefulWidget {
  const ContainerSendMessage({super.key, this.idToken, this.idDestinataire});
  final int? idToken;
  final int? idDestinataire;

  @override
  _ContainerSendMessageState createState() => _ContainerSendMessageState();
}

class _ContainerSendMessageState extends State<ContainerSendMessage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.white,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alignez le texte en haut à gauche
          children: [
            Text(
              "Messages", // Votre texte en haut du container
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Message 2",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  reverse: true, // Faites défiler les messages de haut en bas
                  child: Column(
                    children: [
                      // Vous pouvez afficher les messages ici (par exemple, avec un ListView.builder)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // Espacement entre le texte et l'input
            Container(
              child: TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: "Écrire un message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _sendMessage();
              },
              child: Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final userId = widget.idToken; // ID de l'utilisateur connecté
    final destinataireId = widget.idDestinataire; // ID du destinataire
    final texte = _messageController.text; // Texte saisi par l'utilisateur

    if (userId != null && destinataireId != null && texte.isNotEmpty) {
      try {
        final result = await fetchMessagerie.createMessage(
          userId: userId,
          destinataireId: destinataireId,
          texte: texte,
        );

        if (result == "OK") {
          _messageController.clear(); // Effacer le champ de texte après l'envoi
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Erreur lors de l'envoi du message"),
            ),
          );
        }
      } catch (e) {
        // Gérer les erreurs ici en affichant le message d'erreur dans la console
        print("Erreur lors de l'envoi du message : $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erreur lors de l'envoi du message : $e"),
          ),
        );
      }
    }
  }
}
