import 'dart:io';

void main() {
  String? input = stdin.readLineSync();
  if (input == null || input.isEmpty) return;

  int cents = (double.parse(input) * 100).round();

  List<int> notes = [10000, 5000, 2000, 1000, 500, 200];
  List<int> coins = [100, 50, 25, 10, 5, 1];

  List<int> cashCount = [];
  List<int> coinCount = [];

  for (var note in notes) {
    int split = cents ~/ note;
    cashCount.add(split);
    cents %= note;
  }

  for (var coin in coins) {
    int split = cents ~/ coin;
    coinCount.add(split);
    cents %= coin;
  }

  print('NOTAS:');
  for (var i = 0; i < notes.length; i++) {
    double value = notes[i] / 100;
    print('${cashCount[i]} nota(s) de R\$ ${value.toStringAsFixed(2)}');
  }

  print('MOEDAS:');
  for (var i = 0; i < coins.length; i++) {
    double value = coins[i] / 100;
    print('${coinCount[i]} moeda(s) de R\$ ${value.toStringAsFixed(2)}');
  }
}
