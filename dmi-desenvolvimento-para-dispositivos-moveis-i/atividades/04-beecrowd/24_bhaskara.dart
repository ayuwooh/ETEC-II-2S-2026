import 'dart:io';
import 'dart:math';

void main() {
  List<String> line = stdin.readLineSync()!.split(' ');
  double A = double.parse(line[0]);
  double B = double.parse(line[1]);
  double C = double.parse(line[2]);
  double r1, r2;

  double delta = (B * B) - (4 * A * C);
  if (A == 0 || delta < 0) {
    print('Impossivel calcular');
    return;
  } else {
    r1 = (-B + sqrt(delta)) / (2 * A);
    r2 = (-B - sqrt(delta)) / (2 * A);
  }

  print('R1 = ${r1.toStringAsFixed(5)}');
  print('R2 = ${r2.toStringAsFixed(5)}');
}
