import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:renconsport/models/user.dart';
import 'package:renconsport/services/ApiConfig/apiConfig.dart';
import 'package:renconsport/services/headers/header.dart';

class GetAllUsers {
  static Future<List<User>> fetchUsers() async {
    final Dio _dio = Dio();
    final Header header = Header();

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '${ApiConfig.baseUrl}/users',
        options: Options(headers: header.getHeaders()),
      );

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final usersList = responseData['hydra:member'] as List<dynamic>;

        final users = usersList.map((userJson) => User.json(userJson)).toList();
        print(users);

        return users;
      } else {
        throw Exception('Echec de chargement des utilisateurs');
      }
    } catch (e) {
      throw Exception('Erreur lors de la requête http : $e');
    }
  }
}
