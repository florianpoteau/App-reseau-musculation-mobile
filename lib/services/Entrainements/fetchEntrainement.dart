import 'package:dio/dio.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/ApiConfig/apiConfig.dart';
import 'package:renconsport/services/authToken/getToken.dart';
import 'package:renconsport/services/headers/header.dart';

class FetchEntrainement {
  static final Dio dio = Dio();
  static final Header header = Header();
  static Future<List<Entrainement>> fetchEntrainements() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${ApiConfig.baseUrl}/entrainements',
        options: Options(headers: header.getHeaders()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        if (data != null && data['hydra:member'] is List<dynamic>) {
          final entrainementsList = data['hydra:member'] as List<dynamic>;

          final entrainements = entrainementsList
              .map(
                  (entrainementJson) => Entrainement.fromJson(entrainementJson))
              .toList();

          return entrainements;
        } else {
          throw Exception(
              'La clé "hydra:member" n\'est pas une liste dans la réponse JSON.');
        }
      } else {
        throw Exception('Echec de chargement des entrainements');
      }
    } catch (e, stackTrace) {
      throw Exception('Erreur lors de la requête http : $stackTrace');
    }
  }

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
        throw Exception("Echec de l'enregistrement d'un entrainement");
      }
    } catch (e, stackTrace) {
      print(stackTrace);
      throw Exception('Erreur lors de la requête HTTP : $e');
    }
  }

  static Future<Entrainement> putEntrainement(String nom, String note,
      int? serie, int? repetition, int? poids, int id) async {
    try {
      final Map<String, dynamic> putForm = {
        if (nom.isNotEmpty) 'nom': nom,
        if (note.isNotEmpty) 'note': note,
        if (serie != 0 && serie != null) 'serie': serie,
        if (repetition != 0 && repetition != null) 'repetition': repetition,
        if (poids != 0 && poids != null) 'poids': poids
      };
      final response = await dio.put(
        '${ApiConfig.baseUrl}/entrainements/$id',
        data: putForm,
        options: Options(headers: header.getHeaders()),
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data;
        final Entrainement entrainement = Entrainement.fromJson(responseData);
        return entrainement;
      } else {
        throw Exception("Echec de la mise a jour d'un entrainement");
      }
    } catch (e, stackTrace) {
      throw Exception('Erreur lors de la requête HTTP : $e $serie');
    }
  }

  static void deleteEntrainement(int? id) async {
    try {
      await dio.delete(
        "${ApiConfig.baseUrl}/entrainements/$id",
        options: Options(headers: header.getHeaders()),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
