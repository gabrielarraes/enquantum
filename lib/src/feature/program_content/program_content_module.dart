import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular/circular-moviment-content.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/movimento-circular/circular-moviment-simulation.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/pendulo/animacao-pendulo.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/pendulo/pendulo-conteudo.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/program-content-widget.dart';
import 'package:enquantum/src/feature/program_content/presentation/view/subject_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProgramContentModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/:subjectId", child: (context, args) => SubjectPage(subjectId: int.parse(args.params['subjectId']))),
    ChildRoute("/:subjectId/program-content/movimento-circular", child:(_, __) =>
      const ProgramContentWidget(content: CircularMovimentContent(),simulation: CircularMovimentSimulation())
    ),
    ChildRoute("/:subjectId/program-content/pendulo", child:(_, __) =>
        const ProgramContentWidget(content: PenduloConteudo(), simulation: PenduloSimulacao())
    ),
    // ChildRoute("/:subjectId/program-content/movimento-circular", child:(_, __) =>
    //     ProgramContentWidget()
    // )
  ];
}