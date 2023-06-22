import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-simulation.dart';
import 'package:flutter/cupertino.dart';

class CircularMovimentSimulation extends AbstractSimulation {
  const CircularMovimentSimulation({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: Text('animacao movimento circular', style: TextStyle(fontSize: 10.0))
  );
}