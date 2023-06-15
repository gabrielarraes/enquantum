import 'package:enquantum/src/feature/program_content/presentation/view/subject_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:enquantum/src/feature/home/view/page/home_page.dart';

class ProgramContentModule extends Module {

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/:subjectId", child: (context, args) => SubjectPage(subjectId: int.parse(args.params['subjectId']))),
    ChildRoute("/program-content/:subject-id/:program-id", child:(_, __) => HomePage())
  ];
}