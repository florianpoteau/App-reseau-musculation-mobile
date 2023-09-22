import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/models/exercice.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/ApiConfig/apiConfig.dart';
import 'package:renconsport/services/headers/header.dart';

class GetExercices {
  static Future<List<Exercice>> fetchExercices() async {
    final Dio _dio = Dio();
    final Header header = Header();
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConfig.baseUrl}/exercices',
        options: Options(headers: header.getHeaders()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        if (data != null && data['hydra:member'] is List<dynamic>) {
          final exercicesList = data['hydra:member'] as List<dynamic>;

          final exercices = exercicesList
              .map((exerciceJson) => Exercice.fromJson(exerciceJson))
              .toList();

          return exercices;
        } else {
          throw Exception(
              'La clé "hydra:member" n\'est pas une liste dans la réponse JSON.');
        }
      } else {
        throw Exception('Echec de chargement des exercices');
      }
    } catch (e, stackTrace) {
      throw Exception('Erreur lors de la requête http : $stackTrace');
    }
  }
}
