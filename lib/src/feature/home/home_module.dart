import 'package:flutter_modular/flutter_modular.dart';
import 'package:enquantum/src/feature/home/view/page/home_page.dart';

class HomeModule extends Module {

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute("/", child:(_, __) => HomePage())
  ];
}