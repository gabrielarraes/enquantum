import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:equatable/equatable.dart';

class MovimentoCircularSimulationState extends Equatable {

  Offset center;
  Offset position;
  double angle;
  double angleInit;
  double angularVelocity;
  double frequency;
  double radius;
  double velocityInit;
  double step;
  double time;
  Timer? timer;
  bool isRunning;

  MovimentoCircularSimulationState({
    this.center = Offset.zero,
    this.position = Offset.zero,
    this.frequency = 1,
    this.angle = 0,
    this.angleInit = 0,
    this.angularVelocity = 2 * pi * 1,
    this.radius = 100,
    this.velocityInit = 2 * pi * 1 / 100,
    this.step = 0,
    this.time = 0.05,
    this.timer,
    this.isRunning = false
  });

  MovimentoCircularSimulationState copyWith({
    Offset? center,
    Offset? position,
    double? frequency,
    double? angle,
    double? angleInit,
    double? radius,
    double? angularVelocity,
    double? velocityInit,
    double? step,
    double? time,
    Timer? timer,
    bool? isRunning
    }) {
    return MovimentoCircularSimulationState(
      center: center ?? this.center,
      position: position ?? this.position,
      frequency: frequency ?? this.frequency,
      angleInit: angleInit ?? this.angleInit,
      angle: angle ?? this.angle,
      radius: radius ?? this.radius,
      angularVelocity: angularVelocity ?? this.angularVelocity,
      velocityInit: velocityInit ?? this.velocityInit,
      step: step ?? this.step,
      time: time ?? this.time,
      timer: timer ?? this.timer,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [center, position, frequency, step, angle, angleInit,radius, angularVelocity, velocityInit, time, isRunning];



}