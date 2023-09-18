import 'package:dio/dio.dart';

class Header {
  final Dio _dio;

  Header() : _dio = Dio();

  void setAuthToken(String authToken) {
    _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }

  Map<String, dynamic> getHeaders() {
    return _dio.options.headers;
  }
}
