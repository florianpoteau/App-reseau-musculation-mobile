import 'package:dio/dio.dart';

class Header {
  final String authToken;
  final Dio _dio = Dio();

  Header(this.authToken) {
    _dio.options.headers['Authorization'] = authToken;
  }
}
