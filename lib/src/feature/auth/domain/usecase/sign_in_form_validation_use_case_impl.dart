import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:enquantum/src/feature/auth/data/repository/auth_repository.dart';
import 'package:enquantum/src/feature/auth/domain/model/user.dart';
import 'package:enquantum/src/feature/auth/domain/repository/sign_in_form_validation_use_case.dart';

class SignInFormValidationUseCaseImpl implements SignInFormValidationUseCase {
  final AuthRepository _authRepository = Modular.get<AuthRepository>();
  final FlutterSecureStorage _secureStorage = Modular.get<FlutterSecureStorage>();

  @override
  Future<dynamic> signIn(String password, String username) async {
    if(!validateUsername(username) || !validatePassword(password)) {
      return false;
    }

    try {
      await _authRepository.SignIn(User(username: username , password: password));

      if(await _secureStorage.containsKey(key: 'jwt')) {
        Modular.to.navigate('/home');
      }

      return null;
    } catch (e) {
      return e;
    }    
  }

  @override
  bool validateUsername(String email) {
    return email != "";
  }

  @override
  bool validatePassword(String password) {
    return password != "";
  }

}