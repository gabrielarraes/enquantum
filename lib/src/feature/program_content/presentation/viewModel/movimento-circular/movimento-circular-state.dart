import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';

class MovimentoCircularState extends Equatable {
  Offset center = Offset.zero;
  double angle;
  double angleInit;
  double comprimento;
  double velocityInit;
  Timer? timer;
  double aceleracaoGravitacional;
  double time;
  double initialAngle;
  Offset position;
  bool isRunning;

  MovimentoCircularState({
    this.center = Offset.zero,
    this.angle = 0,
    this.initialAngle = 0.5,
    this.comprimento = 100,
    this.velocityInit = 0,
    this.timer,
    this.aceleracaoGravitacional = 10,
    this.time = 0,
    this.position = Offset.zero,
    this.angleInit = 0.5,
    this.isRunning = false
  });

  MovimentoCircularState copyWith({
    Offset? center,
    double? angle,
    double? comprimento,
    double? velocityInit,
    Timer? timer,
    double? time,
    double? initialAngle,
    double? aceleracaoGravitacional,
    Offset? position,
    double? angleInit,
    bool? isRunning
  }) {
    return MovimentoCircularState(
      isRunning: isRunning ?? this.isRunning,
      angleInit: angleInit ?? this.angleInit,
      center: center ?? this.center,
      time: time ?? this.time,
      position: position ?? this.position,
      initialAngle: initialAngle ?? this.initialAngle,
      angle: angle ?? this.angle,
      comprimento: comprimento ?? this.comprimento,
      velocityInit: velocityInit ?? this.velocityInit,
      timer: timer ?? this.timer,
      aceleracaoGravitacional: aceleracaoGravitacional ?? this.aceleracaoGravitacional,
    );
  }

  @override
  List<Object> get props => [
    center, angle, comprimento, velocityInit, aceleracaoGravitacional, time, angleInit, position, isRunning
  ];
}