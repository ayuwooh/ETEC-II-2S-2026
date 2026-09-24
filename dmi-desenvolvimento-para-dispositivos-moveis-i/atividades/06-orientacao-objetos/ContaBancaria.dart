import 'dart:io';

class ContaBancaria {
    double _saldo = 6969;

    getSaldo(){
        return this._saldo;
    }

    deposit(deposit){
        this._saldo += deposit;
        print('Novo saldo: ${_saldo}');
    }

    withdraw(withdraw){
        if (this._saldo >= withdraw){
            this._saldo -= withdraw;
            print('Novo saldo: ${_saldo}');
        } else {
            print('Saldo insuficiente. Saldo disponível: ${_saldo}');
        }
    }
}

void main(){
    ContaBancaria a = ContaBancaria();
    print('Bem vindo(a) a sua conta bancaria.');
    print('Seu saldo é de: ${a.getSaldo()}');
    while (true){
        print('Deseja depositar ou sacar? Digite "sair" para fechar.');
        String? choice = stdin.readLineSync()!.trim().toLowerCase();
        if (choice == 'depositar') {
            print('Digite o quanto deseja depositar:');
            double deposit = double.parse(stdin.readLineSync()!);
            a.deposit(deposit);
        } else if (choice == 'sacar') { 
            print('Digite o quanto deseja sacar:');
            double withdraw = double.parse(stdin.readLineSync()!);
            a.withdraw(withdraw);
        } else if (choice == 'sair') {
            break;
        } else {
            print('Essa opção não existe.');
        }   
    }
}