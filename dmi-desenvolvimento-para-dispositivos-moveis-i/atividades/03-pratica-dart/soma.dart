import "dart:io";

void main() {
  print("Digite um valor inteiro. ");
  int valorUm = int.parse(stdin.readLineSync()!);
  print("Digite outro valor inteiro. ");
  int valorDois = int.parse(stdin.readLineSync()!);

  int soma = valorUm + valorDois;

  print('Soma: $soma');
}
