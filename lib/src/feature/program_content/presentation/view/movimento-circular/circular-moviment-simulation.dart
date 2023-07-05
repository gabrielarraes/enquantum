import 'dart:async';

import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-simulation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/movimento-circular/movimento-circular-position-calculator.dart';

// class CircularMovimentSimulation extends AbstractSimulation {
//   const CircularMovimentSimulation({super.key});
//
//   @override
//   Widget build(BuildContext context) => Center(
//       child: Text('animacao movimento circular', style: TextStyle(fontSize: 10.0))
//   );
// }

class CircularMovimentSimulation extends StatefulWidget {
  const CircularMovimentSimulation({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<CircularMovimentSimulation> {
  Offset center = Offset.zero;
  // Variáveis a respeito da bolinha
  Offset position = Offset.zero;
  Offset position2 = Offset.zero;

  late double postVertical;

  double frequency = 1;
  double angle = 0;
  double raio = 100;
  late double angularVelocity = 0;
  late double velocityInit = 0;
  double aceleracaoAngular = 2;
  double time = 0.05;
  late Timer timerGlobal;
  final frequencyControler = TextEditingController();

  void dispose() {
    frequencyControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Ao iniciar o estado da página, chama nosso método timer
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    // Centro setado no centro da tela
    center = Offset(sizeScreen.width / 2, sizeScreen.height / 2);

    //position2 = position;
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomPaint(
                  painter: Painter(center, position, center, position),
                  child: const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Slider(
                        value: aceleracaoAngular,
                        max: 15,
                        divisions: 15,
                        label: aceleracaoAngular.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            aceleracaoAngular = value;
                          });
                        },
                      ),
                      Center(
                        child: ElevatedButton(
                          child: Text("start"),
                          onPressed: () {
                            this.timer(sizeScreen);
                            content:
                            Text(frequencyControler.text);
                            // time = 0.05;
                          },
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }

  void timer(Size size) {
    setState(() {});

    var timerGlobal = Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      setState(() {
        time += 0.05;
        position = movimentoCircularCalculatePosition(raio, angularVelocity, aceleracaoAngular, time);
      });

      // Chama a si mesmo noR
    });
  }
}

class Painter extends CustomPainter {
  final Offset center;
  final Offset position;

  Offset posterior;

  Painter(this.center, this.position, this.anterior, this.posterior);
  Offset anterior = Offset.zero;
  @override
  void paint(Canvas canvas, Size size) {
    // Seta o centro do canvas como o centro recebido como argumento
    canvas.translate(center.dx, center.dy);

    Paint pencil = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Desenha um círculo de raio 5 na posição recebida
    canvas.drawCircle(position, 10, pencil);
    canvas.drawLine(Offset.zero, position, pencil);
    //canvas.drawLine(this.anterior, position, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}