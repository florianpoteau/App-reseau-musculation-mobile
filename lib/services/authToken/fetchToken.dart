import 'dart:convert';

import 'package:renconsport/models/session.dart';
import 'package:renconsport/services/authToken/authService.dart';

class Service {
  static Future fetchToken(email, password) async {
    AuthService authService = AuthService();
    final response = await authService.getToken(email, password);
    return response;
  }
}
