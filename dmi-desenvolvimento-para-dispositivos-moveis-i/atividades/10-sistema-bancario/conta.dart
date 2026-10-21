import 'excecoes.dart';
import 'mixins.dart';
import 'transacao.dart';

/// Tipos de conta suportados pelo banco.
enum TipoConta { corrente, poupanca }

/// Classe abstrata que representa uma conta bancária.
///
/// * **Abstração**: declara o que toda conta faz (`depositar`, `sacar`,
///   `transferir`, `aplicarTaxa`...) e deixa de fora o que só cada tipo sabe
///   fazer. Por isso `Conta` não pode ser instanciada.
/// * **Encapsulamento**: saldo, limite e PIN ficam privados (`_`) e são
///   expostos por *getters* e *setters* que validam os valores.
/// * **Herança**: [ContaCorrente] e [ContaPoupanca] aproveitam tudo o que
///   está aqui e acrescentam o que é do seu tipo.
/// * **Polimorfismo**: `tipoConta`, `taxaDeManutencao()` e
///   `aplicarRendimento()` são resolvidos em tempo de execução, conforme o
///   objeto real.
///
/// As três classes estão no mesmo arquivo de propósito: no Dart o `_` protege
/// o membro dentro da *biblioteca* (o arquivo), e não dentro da classe. Com
/// tudo junto, as subclasses manipulate o saldo da conta base sem precisar de
/// uma API pública só para isso.
abstract class Conta with Extrato, Autenticavel {
  /// Número da conta.
  final String numero;

  /// Nome do titular.
  final String titular;

  /// PIN de acesso — privado, nunca sai da classe.
  final String _pin;

  double _saldo;
  final double _limite;

  Conta({
    required this.numero,
    required this.titular,
    required String pin,
    double saldoInicial = 0,
    double limite = 0,
  })  : _pin = pin,
        _saldo = saldoInicial,
        _limite = limite;

  // -------------------------------------------------------------------
  // Encapsulamento: getters e setters
  // -------------------------------------------------------------------

  /// Saldo atual da conta.
  double get saldo => _saldo;

  /// Permite ajustar o saldo, recusando valores negativos.
  set saldo(double valor) {
    if (valor < 0) {
      throw ValorInvalidoException('o saldo não pode ser negativo');
    }
    _saldo = valor;
  }

  /// Limite de crédito da conta (cheque especial).
  double get limite => _limite;

  // -------------------------------------------------------------------
  // Abstração: o que cada tipo de conta precisa definir
  // -------------------------------------------------------------------

  /// Nome do tipo da conta (`Conta Corrente`, `Conta Poupança`...).
  String get tipoConta;

  /// Taxa de manutenção do mês.
  double taxaDeManutencao();

  /// Rendimento do mês. O padrão é não render; a poupança sobrescreve.
  void aplicarRendimento() {}

  // -------------------------------------------------------------------
  // Operações
  // -------------------------------------------------------------------

  /// Deposita um valor na conta.
  void depositar(double valor) {
    _validarValor(valor);
    _creditar(valor, Transacao.deposito(valor));
  }

  /// Saca um valor da conta.
  ///
  /// O saque pode usar o limite (cheque especial): o saldo pode ficar
  /// negativo até o limite da conta.
  void sacar(double valor) {
    _validarValor(valor);
    final disponivel = _saldo + _limite;
    if (valor > disponivel) {
      throw SaldoInsuficienteException(valor, disponivel);
    }
    _debitar(valor, Transacao.saque(valor));
  }

  /// Transfere um valor desta conta para outra.
  void transferir(Conta destino, double valor) {
    _validarValor(valor);
    if (destino.numero == numero) {
      throw OperacaoBancariaException(
          'não é possível transferir para a própria conta');
    }
    final disponivel = _saldo + _limite;
    if (valor > disponivel) {
      throw SaldoInsuficienteException(valor, disponivel);
    }
    _debitar(valor, Transacao.transferencia(valor, destino.numero));
    destino._creditar(valor, Transacao.recebimento(valor, numero));
  }

  /// Cobra a taxa de manutenção do mês.
  ///
  /// Aqui mora o polimorfismo: `taxaDeManutencao()` é chamado em uma única
  /// linha, mas cada tipo de conta responde de um jeito diferente.
  void aplicarTaxa() {
    final taxa = taxaDeManutencao();
    if (taxa <= 0) {
      return;
    }
    final valor = taxa > _saldo ? _saldo : taxa;
    if (valor <= 0) {
      return;
    }
    _debitar(valor, Transacao.taxa(valor));
  }

  /// Confere o PIN informado com o PIN cadastrado.
  bool validarPin(String pinInformado) => pinInformado == _pin;

  /// Credita um valor e registra o movimento no extrato.
  void _creditar(double valor, Transacao transacao) {
    _saldo += valor;
    registrar(transacao);
  }

  /// Debita um valor e registra o movimento no extrato.
  void _debitar(double valor, Transacao transacao) {
    _saldo -= valor;
    registrar(transacao);
  }

  /// Valida valores de dinheiro recebidos do usuário.
  static void _validarValor(double valor) {
    if (valor <= 0) {
      throw ValorInvalidoException('o valor deve ser maior que zero');
    }
  }

  @override
  String toString() => '$tipoConta $numero | Titular: $titular | '
      'Saldo: R\$ ${_saldo.toStringAsFixed(2)}';
}

/// Conta corrente: tem cheque especial e cobra 2% de manutenção ao mês.
class ContaCorrente extends Conta {
  /// Percentual de manutenção cobrado ao mês.
  static const double taxaManutencao = 0.02;

  ContaCorrente({
    required super.numero,
    required super.titular,
    required super.pin,
    super.saldoInicial = 0,
    super.limite = 3000,
  });

  @override
  String get tipoConta => 'Conta Corrente';

  @override
  double taxaDeManutencao() => saldo * taxaManutencao;
}

/// Conta poupança: não cobra taxa e rende 1% ao mês.
class ContaPoupanca extends Conta {
  /// Percentual de rendimento aplicado ao mês.
  static const double rendimentoMensal = 0.01;

  ContaPoupanca({
    required super.numero,
    required super.titular,
    required super.pin,
    super.saldoInicial = 0,
    super.limite = 0,
  });

  @override
  String get tipoConta => 'Conta Poupança';

  @override
  double taxaDeManutencao() => 0;

  @override
  void aplicarRendimento() {
    final valor = saldo * rendimentoMensal;
    if (valor <= 0) {
      return;
    }
    _creditar(valor, Transacao.rendimento(valor));
  }
}
