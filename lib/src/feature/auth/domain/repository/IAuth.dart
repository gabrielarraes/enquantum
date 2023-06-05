
import 'package:enquantum/src/feature/auth/data/dto/register_response.dart';
import 'package:enquantum/src/feature/auth/domain/model/registration_user.dart';
import 'package:enquantum/src/feature/auth/domain/model/user.dart';

abstract class IAuth {
  Future<RegisterResponse?> register(registration_user registration);
  Future<void> SignIn(User user);

}