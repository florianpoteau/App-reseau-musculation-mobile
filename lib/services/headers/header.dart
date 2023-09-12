import 'package:dio/dio.dart';

class Header {
  final Dio _dio;

  Header(Object authToken) : _dio = Dio() {
    _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }
}
