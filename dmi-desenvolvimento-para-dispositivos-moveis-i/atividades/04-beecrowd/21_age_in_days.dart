import 'dart:io';

void main() {
  int agedays = int.parse(stdin.readLineSync()!);

  int years = agedays ~/ 365;
  int months = (agedays % 365) ~/ 30;
  int days = (agedays % 365) % 30;

  print('$years ano(s)');
  print('$months mes(es)');
  print('$days dia(s)');
}