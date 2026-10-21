import 'dart:io';

abstract class ContaBancaria {
  String titular = 'Gay';
  String numero = '1';
  String _pin = '123';
  double _saldo = 6969;

  getSaldo() {
    return this._saldo;
  }

  deposit(deposit) {
    this._saldo += deposit;
    print('Novo saldo: ${_saldo}');
  }

  withdraw(withdraw) {
    if (this._saldo >= withdraw) {
      this._saldo -= withdraw;
      print('Novo saldo: ${_saldo}');
    } else {
      print('Saldo insuficiente. Saldo disponível: ${_saldo}');
    }
  }
}

class ContaCorrente extends ContaBancaria {
  double taxa = 0.02;

  getTax() {
    double toPay = this._saldo * taxa;
    return toPay;
  }

  payTax() {
    double toPay = this._saldo * taxa;
    this._saldo -= toPay;
  }
}

void main() {
  ContaCorrente a = ContaCorrente();
  print('Bem vindo ${a.titular} a sua conta bancaria.');
  print('Seu saldo é de: ${a.getSaldo()}');
  while (true) {
    print(
      'Deseja depositar, sacar ou "pagar" taxa? Digite "sair" para fechar.',
    );
    String? choice = stdin.readLineSync()!.trim().toLowerCase();
    if (choice == 'depositar') {
      print('Digite o quanto deseja depositar:');
      double deposit = double.parse(stdin.readLineSync()!);
      a.deposit(deposit);
    } else if (choice == 'sacar') {
      print('Digite seu PIN');
      String? pin = stdin.readLineSync()!.trim();
      if (pin == a._pin) {
        print('Digite o quanto deseja sacar:');
        double withdraw = double.parse(stdin.readLineSync()!);
        a.withdraw(withdraw);
      } else {
        print('PIN incorreto.');
        continue;
      }
    } else if (choice == 'pagar') {
      print('Valor da taxa: ${a.getTax()}');
      a.payTax();
      print('Taxa paga com sucesso!');
    } else if (choice == 'sair') {
      break;
    } else {
      print('Essa opção não existe.');
    }
  }
}
