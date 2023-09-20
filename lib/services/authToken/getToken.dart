import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetToken {
  static Future<Map<String, dynamic>?> getToken() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      final parts = token.split('.');
      if (parts.length == 3) {
        String payloadPart = parts[1];
        while (payloadPart.length % 4 != 0) {
          payloadPart += "=";
        }
        final payload = json.decode(
          utf8.decode(base64Url.decode(payloadPart)),
        );
        print(payload);
        return payload;
      } else {
        print("Token mal formé. Il doit avoir trois parties.");
      }
    }
    return null;
  }
}
