import "dart:io";

void main() {
  int split = 0;
  var notas = [];
  var nums = [100, 50, 20, 10, 5, 2, 1];

  print('Digite um valor inteiro.');
  int value = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < nums.length; i++) {
    split = value ~/ nums[i];
    notas.add(split);
    value %= nums[i];
  }

  for (var i = 0; i < nums.length; i++) {
    print('${notas[i]} notas de R\$${nums[i]}');
  }
}
