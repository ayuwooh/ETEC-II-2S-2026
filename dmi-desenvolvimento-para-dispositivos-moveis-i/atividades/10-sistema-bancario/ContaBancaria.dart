import 'dart:io';

abstract class ContaBancaria {
  String titular = 'Gay';
  String numero = '1';
  String _pin = '123';
  double _saldo = 6969;

  double getSaldo() {
    return this._saldo;
  }

  void deposit(double deposit) {
    this._saldo += deposit;
    print('Novo saldo: ${_saldo}');
  }

  void withdraw(double withdraw) {
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
  double get toPay => _saldo * taxa;

  double getTax() {
    return toPay;
  }

  void payTax() {
    _saldo -= toPay;
  }
}

class ContaPoupanca extends ContaBancaria {
  double renda = 0.07;
  double get revenue => _saldo * renda;

  double getRev() {
    return revenue;
  }

  void revIncome() {
    _saldo += revenue;
  }
}

void main() {
  print('Digite o tipo de conta que deseja criar: Corrente ou Poupança');
  String? accType = stdin.readLineSync()!.trim().toLowerCase();

  late ContaBancaria a;

  if (accType == 'corrente') {
    a = ContaCorrente();
  } else if (accType == 'poupança') {
    a = ContaPoupanca();
  } else {
    print('Tipo de conta inválido.');
    return;
  }

  print('Bem vindo ${a.titular} a sua conta bancaria.');
  print('Seu saldo é de: ${a.getSaldo()}');

  while (true) {
    print(
      'Deseja depositar, sacar, "pagar" taxa ou "receber" renda? Digite "sair" para fechar.',
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
      if (a is ContaCorrente) {
        print('Valor da taxa: ${a.getTax()}');
        a.payTax();
        print('Taxa paga com sucesso!');
      } else {
        print('Contas poupança não possuem taxas!');
      }
    } else if (choice == 'receber') {
      if (a is ContaPoupanca) {
        print('Valor de renda: ${a.getRev()}');
        a.revIncome();
        print('Renda obtida com sucesso!');
      } else {
        print('Contas correntes não recebem renda automática!');
      }
    } else if (choice == 'sair') {
      break;
    } else {
      print('Essa opção não existe.');
    }
  }
}
