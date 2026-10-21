/// Erro genérico do sistema bancário.
///
/// Todas as falhas de negócio herdam desta classe, então o menu consegue
/// tratá-las de uma vez só (`on OperacaoBancariaException`).
class OperacaoBancariaException implements Exception {
  /// Descrição do erro, pronta para mostrar ao usuário.
  final String mensagem;

  OperacaoBancariaException(this.mensagem);

  @override
  String toString() => 'OperacaoBancariaException: $mensagem';
}

/// Saldo insuficiente para realizar a operação.
class SaldoInsuficienteException extends OperacaoBancariaException {
  /// Quanto foi pedido.
  final double valorSolicitado;

  /// Quanto a conta conseguia cobrir.
  final double saldoDisponivel;

  SaldoInsuficienteException(this.valorSolicitado, this.saldoDisponivel)
      : super('saldo insuficiente: solicitado R\$ '
            '${valorSolicitado.toStringAsFixed(2)}, disponível R\$ '
            '${saldoDisponivel.toStringAsFixed(2)}');
}

/// PIN informado não confere com o cadastrado.
class CredencialInvalidaException extends OperacaoBancariaException {
  CredencialInvalidaException([String mensagem = 'PIN incorreto'])
      : super(mensagem);
}

/// Dado ou valor informado pelo usuário é inválido.
class ValorInvalidoException extends OperacaoBancariaException {
  ValorInvalidoException(String mensagem) : super(mensagem);
}
