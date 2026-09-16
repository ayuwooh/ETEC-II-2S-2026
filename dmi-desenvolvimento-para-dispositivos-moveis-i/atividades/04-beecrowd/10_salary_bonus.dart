import 'dart:io';

void main() {
  stdin.readLineSync();
  double fixesSal = double.parse(stdin.readLineSync()!);
  double totalSold = double.parse(stdin.readLineSync()!);

  double total = (0.15 * totalSold) + fixesSal;

  print('TOTAL = R\$ ${total.toStringAsFixed(2)}');
}
