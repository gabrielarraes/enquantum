import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-simulation.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/pendulo/pendulo-simulation-cubit.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/pendulo/pendulo-simulation-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenduloSimulation extends StatelessWidget implements AbstractSimulation {
  const PenduloSimulation({ super.key });

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => PenduloSimulationCubit()..execute(sizeScreen.width / 2, sizeScreen.height / 2 - 200),
      child: BlocBuilder<PenduloSimulationCubit, PenduloSimulationState>(
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: Painter(state.center, state.position),
                    child: const SizedBox(width: double.infinity, height: double.infinity)
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Configurações',
                              style: TextStyle(fontSize: 24, color: Colors.deepPurple, fontWeight: FontWeight.w500)
                            ),
                            const SizedBox(height: 32.0),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Text('Aceleração gravitacional', style: TextStyle(fontWeight: FontWeight.w600))
                                ),
                                Slider(
                                  activeColor: Colors.deepPurple,
                                  thumbColor: Colors.deepPurple,
                                  inactiveColor: Colors.deepPurple.shade100,
                                  value: state.aceleracaoGravitacional,
                                  max: 100,
                                  divisions: 20,
                                  label: state.aceleracaoGravitacional.round().toString(),
                                  onChanged: (double value) => context.read<PenduloSimulationCubit>().setAceleration(value)
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Text('Comprimento', style: TextStyle(fontWeight: FontWeight.w600))
                                ),
                                Slider(
                                  activeColor: Colors.deepPurple,
                                  thumbColor: Colors.deepPurple,
                                  inactiveColor: Colors.deepPurple.shade100,
                                  value: state.comprimento,
                                  max: 130,
                                  divisions: 20,
                                  label: state.comprimento.round().toString(),
                                  onChanged: (double value) => context.read<PenduloSimulationCubit>().setComprimento(value)
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Text('Angulo', style: TextStyle(fontWeight: FontWeight.w600))
                                ),
                                Slider(
                                  activeColor: Colors.deepPurple,
                                  thumbColor: Colors.deepPurple,
                                  inactiveColor: Colors.deepPurple.shade100,
                                  value: state.angleInit,
                                  max: 2,
                                  divisions: 40,
                                  label: state.angleInit.round().toString(),
                                  onChanged: (double value) => context.read<PenduloSimulationCubit>().setInitialAngle(value)
                                ),
                              ],
                            ),

                            const SizedBox(height: 16.0),

                            Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        style: getButtonStyle(),
                                        onPressed: () => context.read<PenduloSimulationCubit>().initTimer(),
                                        child: const Text("start"),
                                      ),
                                      const SizedBox(height: 16.0),
                                      ElevatedButton(
                                        style: getButtonStyle(),
                                        onPressed: () => context.read<PenduloSimulationCubit>().reset(),
                                        child: const Text("reset")
                                      ),
                                      const SizedBox(height: 16.0),
                                      ElevatedButton(
                                        style: getButtonStyle(),
                                        onPressed: () => context.read<PenduloSimulationCubit>().disposeTimer(),
                                        child: const Text("stop")
                                      ),
                                    ]
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Cordenadas: (x: ${state.position.dx.toStringAsFixed(3)}, y: ${state.position.dy.toStringAsFixed(3)})",
                                          style: const TextStyle(fontWeight: FontWeight.w600)
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Aceleração gravitacional: ${state.aceleracaoGravitacional.toString()}",
                                          style: const TextStyle(fontWeight: FontWeight.w600)
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Ângulo: ${state.angleInit.toString()}",
                                          style: const TextStyle(fontWeight: FontWeight.w600)
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Comprimento: ${state.comprimento.toString()}",
                                          style: const TextStyle(fontWeight: FontWeight.w600)
                                        ),
                                      ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}

ButtonStyle getButtonStyle() => ElevatedButton.styleFrom(
  backgroundColor: Colors.deepPurple,
  minimumSize: const Size(112, 38),
  textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontStyle: FontStyle.normal
  ),
);

class Painter extends CustomPainter {
  final Offset center;
  final Offset position;

  Painter(this.center, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(center.dx, center.dy);

    Paint pencil = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, 10, pencil);
    canvas.drawLine(Offset.zero, position, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}