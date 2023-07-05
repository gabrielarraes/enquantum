import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';

class MovimentoVariadoState extends Equatable {
  Offset center = Offset.zero;
  Offset position;
  double frequency;
  double angle;
  double radius;
  double angularVelocity;
  double velocityInit;
  double aceleracaoAngular;
  double time;
  Timer? timer;
  bool isRunning;

  MovimentoVariadoState({
    this.center = Offset.zero,
    this.position = Offset.zero,
    this.frequency = 1,
    this.angle = 0,
    this.radius = 100,
    this.angularVelocity = 0,
    this.velocityInit = 2,
    this.aceleracaoAngular = 2,
    this.time = 0.05,
    this.timer,
    this.isRunning = false
  });

  MovimentoVariadoState copyWith({
    Offset? center,
    Offset? position,
    double? frequency,
    double? angle,
    double? radius,
    double? angularVelocity,
    double? velocityInit,
    double? aceleracaoAngular,
    double? time,
    Timer? timer,
    bool? isRunning
  }) {
    return MovimentoVariadoState(
      center: center ?? this.center,
      position: position ?? this.position,
      frequency: frequency ?? this.frequency,
      angle: angle ?? this.angle,
      radius: radius ?? this.radius,
      angularVelocity: angularVelocity ?? this.angularVelocity,
      velocityInit: velocityInit ?? this.velocityInit,
      aceleracaoAngular: aceleracaoAngular ?? this.aceleracaoAngular,
      timer: timer ?? this.timer,
      time: time ?? this.time,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  @override
  List<Object> get props => [center, position, frequency, angle, radius, angularVelocity, velocityInit, aceleracaoAngular, time, isRunning];
}