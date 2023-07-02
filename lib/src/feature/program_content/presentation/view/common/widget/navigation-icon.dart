import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationIcon extends StatelessWidget {

  final int subjectId;

  const NavigationIcon({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => {
      Modular.to.navigate('/programs/$subjectId')
    },
  );

}