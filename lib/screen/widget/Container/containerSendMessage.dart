import 'package:cloud_firestore/cloud_firestore.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: fetchMessagerie.getPost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('');
                  } else {
                    return ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final doc = snapshot.data!.docs[index];
                        final post = doc.data() as Map<String, dynamic>;
                        final messageUserID = post['user_id'];
                        final destinataireID = post['destinataire_id'];

                        if ((widget.idToken == messageUserID &&
                                widget.idDestinataire == destinataireID) ||
                            (widget.idToken == destinataireID &&
                                widget.idDestinataire == messageUserID)) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: (widget.idToken == messageUserID)
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      color: (widget.idToken == messageUserID)
                                          ? Colors.blue
                                          : Colors.green,
                                      child: Text(post['texte'] ?? ''),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    );
                  }
                },
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
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final userId = widget.idToken;
                final destinataireId = widget.idDestinataire;
                final texte = _messageController.text;

                if (userId != null &&
                    destinataireId != null &&
                    texte.isNotEmpty) {
                  try {
                    final result = await fetchMessagerie.createMessage(
                      userId: userId,
                      destinataireId: destinataireId,
                      texte: texte,
                    );

                    if (result == "OK") {
                      _messageController.clear();
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
              },
              child: Text("Envoyer"),
            ),
          ],
        ),
      ),
    );
  }
}
