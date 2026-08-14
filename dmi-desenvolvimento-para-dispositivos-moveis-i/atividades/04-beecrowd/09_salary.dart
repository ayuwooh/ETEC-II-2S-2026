import 'dart:io';

void main() {
  int number = int.parse(stdin.readLineSync()!);
  int hours = int.parse(stdin.readLineSync()!);
  double salaryperh = double.parse(stdin.readLineSync()!);

  double salary = hours * salaryperh;

  print('NUMBER = $number');
  print('SALARY = U\$ ${salary.toStringAsFixed(2)}');
}
