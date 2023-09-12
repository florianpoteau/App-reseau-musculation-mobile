import 'package:dio/dio.dart';
import 'package:renconsport/models/session.dart';
import 'package:renconsport/services/headers/header.dart';

class Service {
  static Future<Token> fetchToken(email, password) async {
    final Dio dio = Dio();

    final Map<String, dynamic> authData = {
      'username': email,
      'password': password,
    };

    try {
      final response = await dio.post(
        'http://192.168.0.106:8000/api/login_check',
        data: authData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        final Token token = Token.fromJson(responseData);

        print(token.token);
        final Header header = Header(token);

        return token;
      } else {
        throw Exception('Echec de chargement du token');
      }
    } catch (error) {
      throw Exception('Erreur lors de la requête HTTP : $error');
    }
  }
}
