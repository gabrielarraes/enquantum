import 'dart:async';
import 'dart:ui';

import 'package:enquantum/src/feature/program_content/presentation/domain/usecase/movimento-circular/movimento-circular-position-calculator.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/movimento-variado/movimento-variado-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/calculator.dart';

class MovimentoVariadoCubit extends Cubit<MovimentoVariadoState> {
  MovimentoVariadoCubit() : super(MovimentoVariadoState());

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
        setPosition(movimentoCircularCalculatePosition(state.radius, state.angularVelocity, state.aceleracaoAngular, state.time));
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
        frequency: 1,
        angle: 0,
        radius: 100,
        angularVelocity: 0,
        velocityInit: 2,
        time: 0.05,
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

  void accrescentTime(double plus) {
    emit(state.copyWith(time: state.time + plus));
  }

  void setAceleracaoAngular(double angle) {
    emit(state.copyWith(aceleracaoAngular: angle));
  }
}