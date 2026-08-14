import 'dart:io';

void main() {
  List<String> line = stdin.readLineSync()!.split(' ');
  double A = double.parse(line[0]);
  double B = double.parse(line[1]);
  double C = double.parse(line[2]);

  double triangle = (A * C) / 2;
  double circle = 3.14159 * (C * C);
  double trapeze = (A + B) * C / 2;
  double square = B * B;
  double rectangle = A * B;

  print('TRIANGULO: ${triangle.toStringAsFixed(3)}');
  print('CIRCULO: ${circle.toStringAsFixed(3)}');
  print('TRAPEZIO: ${trapeze.toStringAsFixed(3)}');
  print('QUADRADO: ${square.toStringAsFixed(3)}');
  print('RETANGULO: ${rectangle.toStringAsFixed(3)}');
}
