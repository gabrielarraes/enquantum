import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/program-content/program-content-cubit.dart';
import '../viewModel/program-content/program-content-state.dart';
import 'abstract/abstract-simulation.dart';
import 'common/widget/navigation-icon.dart';

class ProgramContentWidget extends StatelessWidget {

  final AbstractContent content;
  final dynamic simulation;
  final String title;
  final int subjectId;

  const ProgramContentWidget({
    super.key,
    required this.content,
    required this.simulation,
    required this.title,
    required this.subjectId
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => ProgramContentCubit(),
    child: BlocBuilder<ProgramContentCubit, ProgramContentState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: [
              NavigationIcon(subjectId: subjectId),
              Expanded(child: Center(child: Text(title)))
            ]
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          currentIndex: state.tab,
          onTap: (index) => context.read<ProgramContentCubit>().tabChanges(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: 'Conteúdo'),
            BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Simulação'),
          ],
        ),
        body: state.tab == 0 ? content: simulation,
      ),
    ),
  );
}