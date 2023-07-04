import 'package:enquantum/src/common/widget/subject-card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SubjectPage extends StatelessWidget {

  final int subjectId;

  const SubjectPage({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Center(child: Text("Modulo"))
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Modular.to.navigate('$subjectId/program-content/movimento-circular'),
              child: const SubjectCard(imgPath: 'lib/assets/images/feature/moviment.png', text: 'Movimento Circular Uniforme',)
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => Modular.to.navigate('/programs/2'),
              child: const SubjectCard(imgPath: 'lib/assets/images/feature/moviment.png', text: 'Movimento Cicular Uniformemente Variado',)
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () => Modular.to.navigate('$subjectId/program-content/pendulo'),
              child: const SubjectCard(imgPath: 'lib/assets/images/feature/graph.png', text: 'Movimento Harmônico Simples',)
            ),
          ],
        ),
      )
    ),
  );
}