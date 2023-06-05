import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppInterceptor extends Interceptor {

  final FlutterSecureStorage storage = Modular.get<FlutterSecureStorage>();

  @override
  Future<void> onRequest(RequestOptions options,  RequestInterceptorHandler handler) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    final String? token = await storage.read(key: 'jwt');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearar ${token ?? ""}'
    };

    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onError(DioError dioError, ErrorInterceptorHandler handler) async {
    print('ERROR[${dioError.response?.statusCode}] => PATH: ${dioError.response?.requestOptions.baseUrl}');

    if(dioError.response?.statusCode == 401) {
      await storage.delete(key: 'jwt');
      Modular.to.pushNamedAndRemoveUntil("/auth/login", (p) => false);
    }

    super.onError(dioError, handler);
  }

  @override
  FutureOr<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }
}