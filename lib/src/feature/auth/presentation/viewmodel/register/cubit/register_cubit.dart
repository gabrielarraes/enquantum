import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:enquantum/src/feature/auth/data/dto/register_response.dart';
import 'package:enquantum/src/feature/auth/domain/usecase/registration_usecase.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/register/state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  final RegistrationUseCase _useCase = RegistrationUseCase();
  
  void usernameChanges(String username) {
    emit(state.copyWith(username: username));
  }

  void passwordChanges(String password) {
    emit(state.copyWith(password: password));
  }

  void emailChanges(String email) {
    emit(state.copyWith(email: email));
  }

  void register() async  {
    RegisterResponse? response = await _useCase.register(state.email, state.password, state.username);

    if(response?.userId != '') {
      Modular.to.navigate("/auth/sign-in");
    }
  }
}