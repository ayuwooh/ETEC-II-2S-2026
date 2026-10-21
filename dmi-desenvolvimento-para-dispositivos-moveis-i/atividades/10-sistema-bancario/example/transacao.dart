/// Tipo de movimento registrado no extrato da conta.
enum TipoTransacao { deposito, saque, transferencia, taxa, rendimento }

/// Registro de um movimento na conta.
///
/// É imutável: o construtor é `const` e os campos são `final`, então uma
/// movimentação já registrada nunca muda de valor. Os construtores nomeados
/// ([Transacao.deposito], [Transacao.saque]...) deixam a leitura do código
/// mais clara.
class Transacao {
  /// Categoria do movimento.
  final TipoTransacao tipo;

  /// Valor movimentado.
  final double valor;

  /// Momento do movimento.
  final DateTime data;

  /// Texto descritivo do movimento.
  final String descricao;

  const Transacao({
    required this.tipo,
    required this.valor,
    required this.data,
    required this.descricao,
  });

  /// Construtor nomeado: depósito.
  factory Transacao.deposito(double valor) => Transacao(
        tipo: TipoTransacao.deposito,
        valor: valor,
        data: DateTime.now(),
        descricao: 'Depósito em espécie',
      );

  /// Construtor nomeado: saque.
  factory Transacao.saque(double valor) => Transacao(
        tipo: TipoTransacao.saque,
        valor: valor,
        data: DateTime.now(),
        descricao: 'Saque no caixa',
      );

  /// Construtor nomeado: transferência enviada.
  factory Transacao.transferencia(double valor, String destino) => Transacao(
        tipo: TipoTransacao.transferencia,
        valor: valor,
        data: DateTime.now(),
        descricao: 'Transferência para $destino',
      );

  /// Construtor nomeado: transferência recebida.
  factory Transacao.recebimento(double valor, String origem) => Transacao(
        tipo: TipoTransacao.transferencia,
        valor: valor,
        data: DateTime.now(),
        descricao: 'Transferência recebida de $origem',
      );

  /// Construtor nomeado: taxa de manutenção.
  factory Transacao.taxa(double valor) => Transacao(
        tipo: TipoTransacao.taxa,
        valor: valor,
        data: DateTime.now(),
        descricao: 'Taxa de manutenção',
      );

  /// Construtor nomeado: rendimento.
  factory Transacao.rendimento(double valor) => Transacao(
        tipo: TipoTransacao.rendimento,
        valor: valor,
        data: DateTime.now(),
        descricao: 'Rendimento aplicado',
      );

  @override
  String toString() {
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    return '${dia}/${mes}/${data.year} | ${tipo.name.toUpperCase().padRight(13)} | '
        '${valor.toStringAsFixed(2).padLeft(10)} | $descricao';
  }
}
