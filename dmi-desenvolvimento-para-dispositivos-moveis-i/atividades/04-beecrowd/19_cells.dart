import 'dart:io';

void main() {
  int N = int.parse(stdin.readLineSync()!);
  int cash = N;
  int split = 0;
  var notas = [];
  var nums = [100, 50, 20, 10, 5, 2, 1];

  for (var i = 0; i < nums.length; i++) {
    split = N ~/ nums[i];
    notas.add(split);
    N %= nums[i];
  }

  print('$cash');
  for (var i = 0; i < nums.length; i++) {
    print('${notas[i]} nota(s) de R\$ ${nums[i]},00');
  }
}