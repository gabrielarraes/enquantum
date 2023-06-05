import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:enquantum/src/common/integration/client/app_http_client.dart';
import 'package:enquantum/src/feature/auth/data/dto/register_response.dart';
import 'package:enquantum/src/feature/auth/domain/model/registration_user.dart';
import 'package:enquantum/src/feature/auth/domain/model/user.dart';
import 'package:enquantum/src/feature/auth/domain/repository/IAuth.dart';

class AuthRepository implements IAuth {
  final AppHttpCLient http = Modular.get<AppHttpCLient>();
  @override
  Future<RegisterResponse?> register(registration_user registration) {
    return callBackend(registration);
  }

  Future<RegisterResponse?> callBackend(registration_user registration) async {

    final response = await http.post(
      'https://jira-clone-api-production.up.railway.app/api/v1/sign-up',
      {
        "user_password": registration.password,
        "user_email": registration.email,
        "user_username": registration.name,
      },
    );
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<void> SignIn(User user) async {
    try {
      final response = await http.post('https://jira-clone-api-production.up.railway.app/api/v1/auth', user.toJson());
      const storage = FlutterSecureStorage(); 
      
      await storage.write(key: 'jwt', value: response.data.toString());
    } catch (_) { }
  }
}
