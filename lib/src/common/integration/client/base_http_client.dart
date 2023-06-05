import 'package:dio/dio.dart';

abstract class BaseHttpClient {
  Future<Response<dynamic>> get    (String url);
  Future<Response<dynamic>> post   (String url, dynamic payload);
  Future<Response<dynamic>> put    (String url, dynamic payload);
  Future<Response<dynamic>> delete (String url, dynamic payload);
}