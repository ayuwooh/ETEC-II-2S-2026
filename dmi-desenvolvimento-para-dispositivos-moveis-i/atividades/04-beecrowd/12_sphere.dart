import 'dart:io';

void main() {
  double pi = 3.14159;
  double R = double.parse(stdin.readLineSync()!);

  double vol = (4 / 3.0) * pi * (R * R * R);

  print('VOLUME = ${vol.toStringAsFixed(3)}');
}
