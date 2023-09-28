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
        .orderBy('timestamp', descending: false);
    return getMessage.snapshots();
  }
}
