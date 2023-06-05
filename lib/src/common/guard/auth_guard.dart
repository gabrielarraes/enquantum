import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/sign-in');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'jwt');

    return token != null;
  }
  
}