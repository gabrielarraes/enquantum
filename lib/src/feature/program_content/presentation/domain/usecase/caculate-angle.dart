import 'dart:math';

// class CalculateAngle {
//   late double angleInit;
//   late double comprimento;
//   late double time;
//   late double aceleracaoGravitacional;
//   late double angle;
//
//   CalculateAngle(double angleInit, double comprimento, double time, double aceleracaoGravitacional) {
//     this.angleInit = angleInit;
//     this.comprimento = comprimento;
//     this.time = time;
//     this.aceleracaoGravitacional = aceleracaoGravitacional;
//   }
//   double execute() {
//     angle = angleInit * cos(sqrt(aceleracaoGravitacional / comprimento) * time);
//     return angle;
//   }
// }r

double CalculateAngle(double angleInit, double comprimento, double time, double aceleracaoGravitacional) =>
    (angleInit * cos(sqrt(aceleracaoGravitacional / comprimento) * time));