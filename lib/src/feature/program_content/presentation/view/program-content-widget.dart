import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_tab/switch_tab.dart';

import '../viewModel/program-content/program-content-cubit.dart';
import '../viewModel/program-content/program-content-state.dart';
import 'abstract/abstract-simulation.dart';

class ProgramContentWidget extends StatelessWidget {

  final AbstractContent content;
  final AbstractSimulation simulation;

  const ProgramContentWidget({super.key, required this.content, required this.simulation});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text("titulo"),
      )
    ),
    body: SafeArea(
      child: BlocProvider(
        create: (context) => ProgramContentCubit(),
        child: BlocBuilder<ProgramContentCubit, ProgramContentState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              state.tab == 0 ? content : simulation,
              SwitchTab(
                text: const ["Conteúdo", "Simulação"],
                shape: SwitchTabShape.rectangle,
                style: const TextStyle(color: Colors.black),
                thumbColor: Colors.transparent,
                onValueChanged: (index) => context.read<ProgramContentCubit>().tabChanges(index)
              ),
            ],
          )
        ),
      )
    ),
  );
}