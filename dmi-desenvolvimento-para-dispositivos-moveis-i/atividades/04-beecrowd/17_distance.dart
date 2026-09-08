import 'dart:io';

void main() {
  int km = int.parse(stdin.readLineSync()!);

  int time = km * 2;

  print('$time minutos');
}
