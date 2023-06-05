
import 'package:flutter_modular/flutter_modular.dart';
import 'package:enquantum/src/feature/auth/data/repository/auth_repository.dart';
import 'package:enquantum/src/feature/auth/domain/repository/IAuth.dart';
import 'package:enquantum/src/feature/auth/presentation/view/page/register_page.dart';
import 'package:enquantum/src/feature/auth/presentation/view/page/reset_password_page.dart';
import 'package:enquantum/src/feature/auth/presentation/view/page/sign_in_page.dart';


class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<IAuth>((i) => AuthRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/sign-in", child: (_, __) => const SignInPage()),
    ChildRoute("/register", child: (_, __) => const RegisterPage()),
    ChildRoute("/reset-password", child: (_, __) => const ResetPasswordPage()),
  ];
}