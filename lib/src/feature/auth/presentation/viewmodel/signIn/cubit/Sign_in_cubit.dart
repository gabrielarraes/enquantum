import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enquantum/src/feature/auth/domain/usecase/sign_in_form_validation_use_case_impl.dart';
import 'package:enquantum/src/feature/auth/presentation/viewmodel/signIn/state/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  final SignInFormValidationUseCaseImpl _signInFormValidationUseCaseImpl = SignInFormValidationUseCaseImpl();


  void incrementaContador(int contador) {

    contador = contador + 10;

    emit(state.copyWith(contador: contador + 1));
  }

  void usernameChanges(String username) {
    emit(state.copyWith(username: username));
  }

  void passwordChanges(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> signIn() async {
    dynamic response = await _signInFormValidationUseCaseImpl.signIn(state.username, state.password);

    if(response is bool) {
      emit(state.copyWith(status: false));
    }
  }
}