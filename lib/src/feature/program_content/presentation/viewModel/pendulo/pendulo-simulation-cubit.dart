import 'dart:async';
import 'dart:ui';

import 'package:enquantum/src/feature/program_content/presentation/domain/usecase/caculate-angle.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/pendulo/pendulo-simulation-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/calculator.dart';

class PenduloSimulationCubit extends Cubit<PenduloSimulationState> {
  PenduloSimulationCubit() : super(PenduloSimulationState());

  void execute(double width,double height) {
    emit(state.copyWith(center: Offset(width, height)));
  }

  void initTimer() {
    if(state.isRunning) {
      return;
    }

    emit(state.copyWith(
      isRunning: true,
      timer: Timer.periodic(const Duration(milliseconds: 50), (Timer t) {
        setAngle(CalculateAngle(state.angleInit, state.comprimento, state.time, state.aceleracaoGravitacional));
        setPosition(CalculatePosition(state.comprimento, state.angle));
        accrescentTime(0.25);
      })
    ));
  }

  void disposeTimer() {
    if(state.timer != null) {
      state.timer!.cancel();
      emit(state.copyWith(timer: null, isRunning: false));
    }
  }

  void reset() {
    if(state.timer != null) {
      state.timer!.cancel();
    }

    emit(
      state.copyWith(
        angleInit: 0.5,
        angle: 0.5,
        comprimento: 100,
        velocityInit: 0,
        aceleracaoGravitacional: 10,
        time: 0.0,
        initialAngle: 0.5,
        isRunning: false,
        timer: null,
        position: CalculatePosition(100, 0.5),
      )
    );
  }

  void setInitialAngle(double value) {
    emit(state.copyWith(angleInit: value));
  }

  void setComprimento(double value) {
    emit(state.copyWith(comprimento: value));
  }

  void setAceleration(double value) {
    emit(state.copyWith(aceleracaoGravitacional: value));
  }

  void setPosition(Offset? positionValue) {
    if(positionValue != null) {
      emit(state.copyWith(position: positionValue));
    }
  }

  void accrescentTime(double plus) {
    emit(state.copyWith(time: state.time + plus));
  }

  void setAngle(double angle) {
    emit(state.copyWith(angle: angle));
  }
}