import 'dart:math';

double calculateCircularAngle(double angleInit, double step, double frequency) =>
    (angleInit + 2 * pi * frequency * step);