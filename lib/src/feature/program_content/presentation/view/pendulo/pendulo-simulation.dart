import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/usecase/caculate-angle.dart';
import '../../domain/usecase/caculate-velocity.dart';
import '../../domain/usecase/calculator.dart';
//
// class PenduloSimulation extends AbstractSimulation {
//   const PenduloSimulation({super.key});
//
//   @override
//   Widget build(BuildContext context) => Text('data');
// }


class PenduloSimulation extends StatefulWidget {
  const PenduloSimulation({Key? key}) : super(key: key);

  @override
  _PenduloSimulation createState() => _PenduloSimulation();
}

class _PenduloSimulation extends State<PenduloSimulation> {
  Offset center = Offset.zero;

  // Variáveis a respeito da bolinha

  Offset position = Offset.zero;

  late double postVertical;

  double angleInit = 0.5;
  late double angle = angleInit;
  double comprimento = 100;
  late double angularVelocityInit = 0;
  late double velocityInit = 0;
  double time = 0.0;
  double aceleracaoGravitacional = 10;

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
    center = Offset(sizeScreen.width / 2, sizeScreen.height / 2 - 200);

    //position2 = position;
    return Scaffold(
      appBar: AppBar(title: Text("MOVIMENTO HARMÔNICO SIMP0LES")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomPaint(
                painter: Painter(center, position),
                child: const SizedBox(width: double.infinity, height: double.infinity),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 100.0),
                  Slider(
                    value: aceleracaoGravitacional,
                    max: 100,
                    divisions: 20,
                    label: aceleracaoGravitacional.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        aceleracaoGravitacional = value;
                      });
                    },
                  ),
                  Slider(
                    value: comprimento,
                    max: 200,
                    divisions: 20,
                    label: comprimento.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        comprimento = value;
                      });
                    },
                  ),
                  Slider(
                    value: angleInit,
                    max: 2,
                    divisions: 40,
                    label: angleInit.round().toString(),
                    onChanged: (double value) {
                      setState(() { angleInit = value; });
                    },
                  ),
                  Center(
                    child: Row(
                      children: [
                        ElevatedButton(
                          child: const Text("start"),
                          onPressed: () {
                            timer(sizeScreen);
                            content:
                            Text(frequencyControler.text);
                            // time = 0.05;
                          },
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          child: Text("reset"),
                          onPressed: () {
                            this.resset();
                            content: Text(frequencyControler.text);
                            // time = 0.05;
                          },
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          child: Text("stop"),
                          onPressed: () {
                            this.stop();
                            content: Text(frequencyControler.text);
                          },
                        ),
                      ],
                    )
                  )
                ],
              )
            ),
          ],
        )
      ),
    );
    // Padding _widgetTextField() {
    //   return Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: TextField(
    //       controller: frequencyControler,
    //     ),
    //   );
    // }
  }

  void timer(Size size) {
    setState(() {});

    timerGlobal = Timer.periodic(Duration(milliseconds: 50),(Timer t) {
      setState(() {
        angle = CalculateAngle(angleInit, comprimento, time, aceleracaoGravitacional);
        position = CalculatePosition(comprimento, angle);
        time += 0.25;
      });
    });
  }

  void resset() {
    setState(() {
      angleInit = 0.5;
      angle = angleInit;
      comprimento = 100;
      angularVelocityInit = 0;
      velocityInit = 0;
      time = 0.0;
      aceleracaoGravitacional = 10;
      position = CalculatePosition(comprimento, angle);
    });
  }

  void stop() {
    timerGlobal.cancel();
  }
}

class Painter extends CustomPainter {
  final Offset center;
  final Offset position;

  Painter(this.center, this.position);

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