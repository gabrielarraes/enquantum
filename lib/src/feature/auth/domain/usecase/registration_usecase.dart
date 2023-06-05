import 'package:flutter_modular/flutter_modular.dart';
import 'package:enquantum/src/feature/auth/data/dto/register_response.dart';
import 'package:enquantum/src/feature/auth/domain/model/registration_user.dart';
import 'package:enquantum/src/feature/auth/domain/repository/IAuth.dart';

class RegistrationUseCase {
  final repository = Modular.get<IAuth>();

  Future<RegisterResponse?> register(
      String email, String password, String name) async {
    return repository.register(registration_user(email, password, name));
  }

  String? validateEmptyPassword(String label, String value) {
    if (value.isEmpty) {
      return "${label}não pode ser vazio";
    }

    return null;
  }
}
