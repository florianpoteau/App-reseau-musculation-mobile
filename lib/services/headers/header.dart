import 'package:dio/dio.dart';

class Header {
  final Dio _dio;

  Header(Object authToken) : _dio = Dio() {
    final hi = _dio.options.headers['Authorization'] = 'Bearer $authToken';
  }
}
