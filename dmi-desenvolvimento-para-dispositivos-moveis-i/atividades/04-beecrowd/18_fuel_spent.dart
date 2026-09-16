import 'dart:io';

void main() {
  int trip = int.parse(stdin.readLineSync()!);
  int avgspeed = int.parse(stdin.readLineSync()!);

  double fuel = (trip * avgspeed) / 12;

  print('${fuel.toStringAsFixed(3)}');
}
