import 'package:dio/dio.dart';
import 'package:enquantum/src/common/integration/client/base_http_client.dart';
import 'package:enquantum/src/common/integration/interceptor/app_inteceptor.dart';

class AppHttpCLient implements BaseHttpClient {

  late final Dio dio;

  AppHttpCLient(
    Dio client,
  ) {
    dio = client;
    dio.interceptors.add(AppInterceptor());
  }

  @override
  Future<Response<dynamic>> get(String path) async {
    return dio.get(path);
  }

  @override
  Future<Response<dynamic>> post(String path, payload) {
    return dio.post(path, data: payload);
  }

  @override
  Future<Response<dynamic>> put(String path, payload) {
    return dio.put(path);
  }

  @override
  Future<Response<dynamic>> delete(String path, payload) {
    dio.delete(path);
    throw UnimplementedError();
  }

}