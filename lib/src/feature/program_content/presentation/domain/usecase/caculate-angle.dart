import 'dart:math';

double CalculateAngle(double angleInit, double comprimento, double time, double aceleracaoGravitacional) =>
    (angleInit * cos(sqrt(aceleracaoGravitacional / comprimento) * time));