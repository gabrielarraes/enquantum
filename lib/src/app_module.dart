import 'package:dio/dio.dart';
import 'package:enquantum/src/common/guard/auth_guard.dart';
import 'package:enquantum/src/common/integration/client/app_http_client.dart';
import 'package:enquantum/src/feature/auth/auth_module.dart';
import 'package:enquantum/src/feature/home/home_module.dart';
import 'package:enquantum/src/feature/onboard/onboard_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => AppHttpCLient(i())),
    Bind.singleton((i) => const FlutterSecureStorage())
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(Modular.initialRoute, module: OnboardModule()),
    ModuleRoute("/auth", module: AuthModule()),
    ModuleRoute("/home", module: HomeModule(), guards: [AuthGuard()]),
  ];
}
