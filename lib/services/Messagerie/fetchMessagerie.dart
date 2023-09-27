import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fetchMessagerie {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static CollectionReference postMessage =
      FirebaseFirestore.instance.collection('messagerie');

  static Future<String> createMessage(
      {required int userId,
      required int destinataireId,
      required String texte}) async {
    try {
      await _firestore.collection('messagerie').add({
        'user_id': userId,
        "destinataire_id": destinataireId,
        "texte": texte
      });
      return "OK";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
