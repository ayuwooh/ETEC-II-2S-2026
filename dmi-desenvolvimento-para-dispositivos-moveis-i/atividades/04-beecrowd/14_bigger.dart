import 'dart:io';

void main() {
  List<String> line = stdin.readLineSync()!.split(' ');
  int A = int.parse(line[0]);
  int B = int.parse(line[1]);
  int C = int.parse(line[2]);

  int MaiorAB = (A + B + (A - B).abs()) ~/ 2;
  int MaiorABC = (MaiorAB + C + (MaiorAB - C).abs()) ~/ 2;

  print('$MaiorABC eh o maior');
}
