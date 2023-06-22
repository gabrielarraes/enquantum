import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:flutter/cupertino.dart';

class CircularMovimentContent extends AbstractContent {
  const CircularMovimentContent({super.key});

  @override
  Widget build(BuildContext context) => Center(child: Text('movimento circular'));
}