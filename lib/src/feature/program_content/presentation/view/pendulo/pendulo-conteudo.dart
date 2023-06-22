import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-simulation.dart';
import 'package:flutter/cupertino.dart';

class PenduloSimulacao extends AbstractSimulation {
  const PenduloSimulacao({super.key});

  @override
  Widget build(BuildContext context) => Center(child: Text('movimento pendulo animacao'));
}