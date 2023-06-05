import 'package:flutter_modular/flutter_modular.dart';
import 'package:enquantum/src/feature/onboard/view/page/onboard_page.dart';

class OnboardModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, __) => const OnboardPage())
  ];
}