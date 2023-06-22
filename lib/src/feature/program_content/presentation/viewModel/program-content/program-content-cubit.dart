import 'package:enquantum/src/feature/program_content/presentation/viewModel/program-content/program-content-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgramContentCubit extends Cubit<ProgramContentState> {
  ProgramContentCubit() : super(const ProgramContentState());

  void tabChanges(int index) {
    emit(state.copyWith(tab: index));
  }
}