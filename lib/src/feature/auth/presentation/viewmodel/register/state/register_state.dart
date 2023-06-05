import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String username;
  final String password;
  final String email;
  final bool status;

  const RegisterState({
    this.username = '',
    this.password = '',
    this.email = '',
    this.status = false
  });

  RegisterState copyWith({
    String? username,
    String? password,
    String? email,
    bool? status
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [username, password, email, status];
}