import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  int hours = 0;
  int mins = 0;
  int secs = 0;

  hours = N ~/ 3600;
  mins = (N % 3600) ~/ 60;
  secs = N % 60;

  print('$hours:$mins:$secs');
}