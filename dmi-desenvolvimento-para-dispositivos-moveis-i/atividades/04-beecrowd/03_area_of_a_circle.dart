import 'dart:io';

void main() {
  double R = double.parse(stdin.readLineSync()!);

  double A = 3.14159 * (R * R);

  print('A=${A.toStringAsFixed(4)}');
}
