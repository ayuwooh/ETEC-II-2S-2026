import 'dart:io';

void main() {
  int X = int.parse(stdin.readLineSync()!);
  double Y = double.parse(stdin.readLineSync()!);

  double KML = X / Y;

  print('${KML.toStringAsFixed(3)} km/l');
}
