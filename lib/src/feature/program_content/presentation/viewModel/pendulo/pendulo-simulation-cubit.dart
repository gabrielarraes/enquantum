import 'dart:async';
import 'dart:ui';

import 'package:enquantum/src/feature/program_content/presentation/domain/usecase/caculate-angle.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/pendulo/pendulo-simulation-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/calculator.dart';

class PenduloSimulationCubit extends Cubit<PenduloSimulationState> {
  PenduloSimulationCubit() : super(PenduloSimulationState());

  // void tabChanges(int index) {
  //   emit(state.copyWith(tab: index));
  // }

  void setTimer() {
    final timerGlobal = Timer.periodic(Duration(milliseconds: 50),(Timer t) {
      //setState(() {
        // Calculator2 calc2 = Calculator2(comprimento, angle);
        //
        // //calculaVelocidade calulo3 = calculaVelocidade(angleInit, comprimento, time, aceleracaoGravitacional);
        setAngle(CalculateAngle(state.angle, state.comprimento, state.time, state.aceleracaoGravitacional));
        CalculatePosition(state.comprimento, state.angle);
        // print('abc');
        //
        // position = calc2.positionCircumferential();
        // position = calc2.positionCircumferential();
        accrescentTime(0.25);
        // time += 0.25;
      //});

      // Chama a si mesmo noR
    });
  }

  void setPosition(Offset position) {
    emit(state.copyWith(position: position));
  }

  void accrescentTime(double plus) {
    emit(state.copyWith(time: state.time + plus));
  }

  void setAngle(double angle) {
    emit(state.copyWith(angle: angle));
  }
}