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
      borderRadius:
          BorderRadius.circular(10.0), // Ajoutez ici le rayon souhaité
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: "écrire un message",
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
          // Le message a été envoyé avec succès, vous pouvez ajouter une logique ici si nécessaire
          _messageController.clear(); // Effacer le champ de texte après l'envoi
        } else {
          // Gérer les erreurs éventuelles ici
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

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
