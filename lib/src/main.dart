import 'package:enquantum/src/app_module.dart';
import 'package:enquantum/src/app_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(module: AppModule(), child: const AppWidget()),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'pdm',
      //home: const OnboardingPage(),
    );
  }
}
