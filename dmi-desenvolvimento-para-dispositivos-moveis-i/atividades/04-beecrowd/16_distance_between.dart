import 'dart:io';
import 'dart:math';

void main() {
  List<String> line1 = stdin.readLineSync()!.split(' ');
  double x1 = double.parse(line1[0]);
  double y1 = double.parse(line1[1]);

  List<String> line2 = stdin.readLineSync()!.split(' ');
  double x2 = double.parse(line2[0]);
  double y2 = double.parse(line2[1]);

  double distance = sqrt(((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1)));

  print('${distance.toStringAsFixed(4)}');
}
