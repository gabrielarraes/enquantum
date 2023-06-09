import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular-variado/movimento-circular-variado-content.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular-variado/movimento-circular-variado-simulation.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular/circular-moviment-content.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular/circular-moviment-simulation.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/pendulo/pendulo-content.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/pendulo/pendulo-simulation.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/program-content-widget.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/subject_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProgramContentModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/:subjectId", child: (context, args) => SubjectPage(subjectId: int.parse(args.params['subjectId']))),
    ChildRoute("/:subjectId/program-content/movimento-circular",
      child:(context, args) => ProgramContentWidget(
        subjectId: int.parse(args.params['subjectId']),
        content: const CircularMovimentContent(),
        simulation: const CircularMovimentSimulation(),
        title: 'Movimento Circular',
      )
    ),
    ChildRoute("/:subjectId/program-content/movimento-circular-variado",
      child:(context, args) => ProgramContentWidget(
        subjectId: int.parse(args.params['subjectId']),
        content: MovimentoCircularVariadoContent(),
        simulation: MovimentoCircularVariadoSimulation(),
        title: 'Movimento Circular Uniformemente Variado',
      )
    ),
    ChildRoute("/:subjectId/program-content/pendulo",
      child:(context, args) => ProgramContentWidget(
        subjectId: int.parse(args.params['subjectId']),
        content: const PenduloContent(),
        simulation: const PenduloSimulation(),
        title: 'Movimento Harmônico Simples',
      )
    ),
  ];
}
