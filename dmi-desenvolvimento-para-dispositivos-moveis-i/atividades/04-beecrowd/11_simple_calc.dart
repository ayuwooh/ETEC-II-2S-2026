import 'dart:io';

void main() {
  List<String> line1 = stdin.readLineSync()!.split(' ');
  int pieces = int.parse(line1[1]);
  double price = double.parse(line1[2]);

  List<String> line2 = stdin.readLineSync()!.split(' ');
  int pieces2 = int.parse(line2[1]);
  double price2 = double.parse(line2[2]);

  double total = (pieces * price) + (pieces2 * price2);

  print('VALOR A PAGAR: R\$ ${total.toStringAsFixed(2)}');
}
