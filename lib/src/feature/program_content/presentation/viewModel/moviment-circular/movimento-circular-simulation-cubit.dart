import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:enquantum/src/feature/program_content/presentation/domain/usecase/calculate-circular-angle.dart';
import 'package:enquantum/src/feature/program_content/presentation/domain/usecase/calculator.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/moviment-circular/movimento-circular-simulation-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovimentoCircularSimulationCubit extends Cubit<MovimentoCircularSimulationState> {
  MovimentoCircularSimulationCubit() : super(MovimentoCircularSimulationState());

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
          setAngle(calculateCircularAngle(state.angleInit, state.step, state.frequency));
          setPosition(CalculatePosition(state.radius, state.angle));
          setSteap(state.time + 0.05);
          accrescentTime(0.05);
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
          angleInit: 0,
          frequency: 1,
          angle: 0,
          radius: 100,
          velocityInit: 2 * pi * state.frequency / state.radius,
          angularVelocity: 2 * pi * state.frequency,
          time: 0.05,
          step: 0,
          isRunning: false,
          timer: null,
          position: CalculatePosition(100, 0),
        )
    );
  }

  void setPosition(Offset? positionValue) {
    if(positionValue != null) {
      emit(state.copyWith(position: positionValue));
    }
  }

  void setAngle(double angle) {
    emit(state.copyWith(angle: angle));
  }

  void setFrequency(double value) {
    emit(state.copyWith(frequency: value));
  }

  void setSteap(double value) {
    emit(state.copyWith(step: value));
  }

  void accrescentTime(double plus) {
    emit(state.copyWith(time: state.time + plus));
  }
}