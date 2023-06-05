import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String username;
  final String password;
  final int contador;
  final bool status;

  const SignInState({
    this.contador = 0,
    this.username = '',
    this.password = '',
    this.status = true
  });

  SignInState copyWith({
    int? contador,
    String? username,
    String? password,
    bool? status
  }) {
    return SignInState(
      contador: contador ?? this.contador,
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [username, password, status, contador];
}