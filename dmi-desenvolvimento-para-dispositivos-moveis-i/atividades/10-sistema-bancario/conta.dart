class Conta {
  String numero;
  String titular;
  String pin;
  double _saldo = 0;
  double _limite = 3000;

  Conta({required this.numero, required this.titular, required this.pin});

  void getSaldo(){
    return this._saldo;
  }

  void depositar(deposito){
    this._saldo += deposito;
  }
  
  void sacar(saque){
    this._saldo -= saque;
  }

  void transferir(transferencia){
    this._saldo -= transferencia;
    ...
  }

  void gerarExtrato(){

  }
}
