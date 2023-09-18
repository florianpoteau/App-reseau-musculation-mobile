import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:renconsport/models/session.dart';
import 'package:renconsport/services/headers/header.dart';

class Service {
  static Future<Token> fetchToken(email, password) async {
    final Dio dio = Dio();
    final storage = new FlutterSecureStorage();

    final Map<String, dynamic> authData = {
      'username': email,
      'password': password,
    };

    try {
      final response = await dio.post(
        'http://192.168.0.104:8000/api/login_check',
        data: authData,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;

        final Token token = Token.fromJson(responseData);

        await storage.write(key: 'token', value: token.token);
        final Header header = Header();
        header.setAuthToken(token.token);
        final value = await storage.read(key: 'token');
        print(value);

        return token;
      } else {
        throw Exception('Echec de chargement du token');
      }
    } catch (error) {
      throw Exception('Erreur lors de la requête HTTP : $error');
    }
  }
}
