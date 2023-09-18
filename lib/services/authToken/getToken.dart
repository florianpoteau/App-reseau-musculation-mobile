import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetToken {
  static Future<Map<String, dynamic>?> getUsernameFromToken() async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      final parts = token.split('.');
      if (parts.length == 3) {
        final payload = json.decode(
          utf8.decode(base64Url.decode(parts[1])),
        );
        print(payload);
        return payload;
      }
    }
    return null;
  }
}
