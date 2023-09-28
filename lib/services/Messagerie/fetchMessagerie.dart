import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fetchMessagerie {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<String> createMessage(
      {required int userId,
      required int destinataireId,
      required String texte}) async {
    try {
      CollectionReference postMessage =
          FirebaseFirestore.instance.collection('messagerie');
      await _firestore.collection('messagerie').add({
        'user_id': userId,
        "destinataire_id": destinataireId,
        "texte": texte,
        'timestamp': FieldValue.serverTimestamp(),
      });
      return "OK";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  static Stream<QuerySnapshot> getPost() {
    Query getMessage = FirebaseFirestore.instance
        .collection('messagerie')
        .orderBy('timestamp', descending: true);
    return getMessage.snapshots();
  }

  static Future<List<int>> getActiveUserIds(int currentUserId) async {
    final activeUserIds = <int>[];

    try {
      // Récupérer les messages envoyés par l'utilisateur actuel
      final sentMessagesSnapshot = await FirebaseFirestore.instance
          .collection('messagerie')
          .where('user_id', isEqualTo: currentUserId)
          .get();

      for (final doc in sentMessagesSnapshot.docs) {
        final destinataireId = doc['destinataire_id'];
        if (!activeUserIds.contains(destinataireId)) {
          activeUserIds.add(destinataireId);
        }
      }

      // Récupérer les messages reçus par l'utilisateur actuel
      final receivedMessagesSnapshot = await FirebaseFirestore.instance
          .collection('messagerie')
          .where('destinataire_id', isEqualTo: currentUserId)
          .get();

      for (final doc in receivedMessagesSnapshot.docs) {
        final senderId = doc['user_id'];
        if (!activeUserIds.contains(senderId)) {
          activeUserIds.add(senderId);
        }
      }
    } catch (e) {
      print('Erreur lors de la récupération des utilisateurs actifs : $e');
    }

    return activeUserIds;
  }
}
