import 'package:enquantum/src/feature/program_content/presentation/view/abstract/abstract-simulation.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/moviment-circular/movimento-circular-simulation-cubit.dart';
import 'package:enquantum/src/feature/program_content/presentation/viewModel/moviment-circular/movimento-circular-simulation-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircularMovimentSimulation extends AbstractSimulation {
  const CircularMovimentSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => MovimentoCircularSimulationCubit()
          ..execute(sizeScreen.width / 2, sizeScreen.height / 2 - 200),
        child: BlocBuilder<MovimentoCircularSimulationCubit,
            MovimentoCircularSimulationState>(
          builder: (context, state) => Scaffold(
            body: Column(
              children: [
                Expanded(
                    child: CustomPaint(
                        painter: Painter(state.center, state.position),
                        child: const SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                        ))),
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
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 32.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: Text('Frequencia',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600))),
                                  Slider(
                                      activeColor: Colors.deepPurple,
                                      thumbColor: Colors.deepPurple,
                                      inactiveColor: Colors.deepPurple.shade100,
                                      value: state.frequency,
                                      max: 15,
                                      divisions: 15,
                                      label: state.frequency.round().toString(),
                                      onChanged: (double value) => context.read<MovimentoCircularSimulationCubit>().setFrequency(value)
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(children: [
                                      ElevatedButton(
                                        style: getButtonStyle(),
                                        onPressed: () => context
                                            .read<MovimentoCircularSimulationCubit>().initTimer(),
                                        child: const Text("start"),
                                      ),
                                      const SizedBox(height: 16.0),
                                      ElevatedButton(
                                          style: getButtonStyle(),
                                          onPressed: () => context.read<MovimentoCircularSimulationCubit>().reset(),
                                          child: const Text("reset")),
                                      const SizedBox(height: 16.0),
                                      ElevatedButton(
                                          style: getButtonStyle(),
                                          onPressed: () => context.read<
                                              MovimentoCircularSimulationCubit>().disposeTimer(),
                                          child: const Text("stop")),
                                    ]),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Cordenadas: (x: ${state.position.dx.toStringAsFixed(2)}, y: ${state.position.dy.toStringAsFixed(2)})",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "Frequência: ${state.frequency.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600)),
                                            const SizedBox(height: 8),
                                            Text(
                                                "Angulo: ${state.angle.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600)),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ))
              ],
            ),
          ),
        ));
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
