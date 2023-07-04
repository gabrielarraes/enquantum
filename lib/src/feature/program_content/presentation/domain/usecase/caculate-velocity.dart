import 'dart:math';

class calculaVelocidade {
  late double angleInit;
  late double comprimento;
  late double time;
  late double aceleracaoGravitacional;
  late double velocidade;
  calculaVelocidade(double angleInit, double comprimento, double time,
      double aceleracaoGravitacional) {
    this.angleInit = angleInit;
    this.comprimento = comprimento;
    this.time = time;
    this.aceleracaoGravitacional = aceleracaoGravitacional;
  }

  double velCalculator() {
    velocidade = -angleInit *
        sqrt(aceleracaoGravitacional / comprimento) *
        sin(sqrt(aceleracaoGravitacional / comprimento) * time);
    return velocidade;
  }
}