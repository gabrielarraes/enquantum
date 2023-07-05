import 'dart:ui';
import 'dart:math' as math;


Offset movimentoCircularCalculatePosition (raio, angularVelocity, angularAcceleration, time) => Offset(
    raio * math.sin(angularVelocity * time + angularAcceleration * time * time / 2),
    raio * math.cos(angularVelocity * time + angularAcceleration * time * time / 2)
  );