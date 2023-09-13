import 'package:dio/dio.dart';
import 'package:renconsport/models/user.dart';

class AuthRegister {
  static Future<User> postUser(
      String username, String email, String password, int age) async {
    final Dio dio = Dio();
    final Map<String, dynamic> registerAuthData = {
      'email': email,
      'password': password,
      'username': username,
      'age': age
    };
    try {
      final response = await dio.post(
        'http://192.168.0.34:8000/api/users',
        data: registerAuthData,
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data;
        final User user = User(
            email: email, username: username, password: password, age: age);
        return user;
      } else {
        throw Exception("Echec de l'inscription de l'utilisateur");
      }
    } catch (e) {
      throw Exception('Erreur lors de la requête HTTP : $e');
    }
  }
}
