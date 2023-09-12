import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  final String apiUrl = 'http://192.168.0.106:8000/api/login_check';

  Future<Response> getToken(String email, String password) async {
    try {
      final response = await _dio.post(
        apiUrl,
        data: {
          'username': email,
          'password': password,
        },
      );
      print(response);
      return response;
    } catch (e) {
      throw Exception('Erreur lors de la requête : $e');
    }
  }
}
