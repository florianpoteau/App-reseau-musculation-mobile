import 'package:dio/dio.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/ApiConfig/apiConfig.dart';
import 'package:renconsport/services/authToken/getToken.dart';

class PostEntrainement {
  static Future<Entrainement> postEntrainement(
    String nom,
    int serie,
    int repetition,
    int poids,
    int dureeheure,
    bool ispublic,
    String note,
    int exerciceid,
    String selectedDuration,
  ) async {
    final Dio dio = Dio();

    final Map<String, dynamic>? tokenPayload = await GetToken.getToken();
    int userId = tokenPayload?['id'] as int;

    final Map<String, dynamic> registerForm = {
      'nom': nom,
      'serie': serie,
      'repetition': repetition,
      'poids': poids,
      'dureeheure': dureeheure,
      'note': note,
      'ispublic': ispublic,
      'exerciceid': {"id": exerciceid},
      'userid': {"id": userId}
    };

    try {
      final response = await dio.post(
        '${ApiConfig.baseUrl}/entrainements',
        data: registerForm,
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data;
        final Entrainement entrainement = Entrainement.fromJson(responseData);
        return entrainement;
      } else {
        throw Exception("Echec de l'inscription de l'utilisateur");
      }
    } catch (e, stackTrace) {
      print(stackTrace);
      throw Exception('Erreur lors de la requête HTTP : $e');
    }
  }
}
