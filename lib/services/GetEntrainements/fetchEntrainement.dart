import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:renconsport/models/entrainement.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/ApiConfig/apiConfig.dart';
import 'package:renconsport/services/headers/header.dart';

class GetEntrainements {
  static Future<List<Entrainement>> fetchEntrainements() async {
    final Dio _dio = Dio();
    final Header header = Header();
    try {
      final response = await _dio.get<Map<String, dynamic>>(
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
}
