import 'cliente.dart';
import 'conta.dart';
import 'excecoes.dart';

/// Núcleo do sistema: guarda os clientes e as contas e coordena as operações
/// do banco.
///
/// Aqui aparecem as *collections* do Dart:
/// * `Map<String, Cliente>` — busca um cliente pelo CPF sem percorrer a lista;
/// * `List<Conta>` — mantém as contas em ordem de abertura;
/// * `Set<String>` — garante que o mesmo CPF não seja cadastrado duas vezes.
class Banco {
  /// Nome do banco exibido no menu.
  static const String nome = 'Banco Digital ETEC';

  /// PIN padrão das contas abertas pela aplicação.
  static const String pinPadrao = '12345';

  /// Sequência usada para numerar as contas.
  static int _sequenciaConta = 0;

  final Map<String, Cliente> _clientes = <String, Cliente>{};
  final List<Conta> _contas = <Conta>[];
  final Set<String> _cpfsCadastrados = <String>{};

  /// Momento em que o banco foi aberto.
  ///
  /// Exemplo de `late`: o campo é declarado sem valor e atribuído no corpo do
  /// construtor, mas o compilador garante que ele será inicializado antes do
  /// primeiro uso.
  late final DateTime _inicioOperacao;

  Banco() {
    _inicioOperacao = DateTime.now();
  }

  // -------------------------------------------------------------------
  // Métodos estáticos
  // -------------------------------------------------------------------

  /// Gera o próximo número de conta.
  ///
  /// Método estático: pertence à classe e não a uma instância, então pode
  /// controlar o contador de sequência sozinho.
  static String gerarNumeroConta() {
    _sequenciaConta++;
    return 'BD-${_sequenciaConta.toString().padLeft(5, '0')}';
  }

  /// Formata um valor monetário.
  static String formatarMoeda(double valor) =>
      'R\$ ${valor.toStringAsFixed(2)}';

  // -------------------------------------------------------------------
  // Consultas
  // -------------------------------------------------------------------

  /// Contas do banco (cópia somente leitura).
  List<Conta> get contas => List<Conta>.unmodifiable(_contas);

  /// Clientes do banco (cópia somente leitura).
  List<Cliente> get clientes => List<Cliente>.unmodifiable(_clientes.values);

  /// Quantidade de contas abertas.
  int get totalDeContas => _contas.length;

  /// Somatório do saldo de todas as contas.
  double get saldoTotal =>
      _contas.fold<double>(0, (soma, conta) => soma + conta.saldo);

  /// Momento em que o banco foi aberto.
  DateTime get inicioOperacao => _inicioOperacao;

  // -------------------------------------------------------------------
  // Operações
  // -------------------------------------------------------------------

  /// Cadastra um cliente novo.
  Cliente cadastrarCliente({
    required String cpf,
    required String nome,
    required String email,
  }) {
    final cpfLimpo = _normalizarCpf(cpf);
    if (_cpfsCadastrados.contains(cpfLimpo)) {
      throw OperacaoBancariaException('já existe um cliente com o CPF $cpf');
    }
    final cliente = Cliente(cpf: cpfLimpo, nome: nome, email: email);
    _clientes[cpfLimpo] = cliente;
    _cpfsCadastrados.add(cpfLimpo);
    return cliente;
  }

  /// Busca um cliente pelo CPF. Devolve `null` quando não existe.
  Cliente? buscarCliente(String cpf) => _clientes[_normalizarCpf(cpf)];

  /// Abre uma conta para um cliente.
  ///
  /// A mesma assinatura de [Conta] assume comportamentos diferentes conforme
  /// o tipo escolhido: é o polimorfismo na prática.
  Conta abrirConta({
    required Cliente titular,
    required TipoConta tipo,
    double saldoInicial = 0,
  }) {
    final numero = gerarNumeroConta();
    final Conta conta = tipo == TipoConta.poupanca
        ? ContaPoupanca(
            numero: numero,
            titular: titular.nome,
            pin: pinPadrao,
            saldoInicial: saldoInicial,
          )
        : ContaCorrente(
            numero: numero,
            titular: titular.nome,
            pin: pinPadrao,
            saldoInicial: saldoInicial,
          );
    _contas.add(conta);
    return conta;
  }

  /// Busca uma conta pelo número. Devolve `null` quando não existe.
  Conta? buscarConta(String numero) {
    for (final conta in _contas) {
      if (conta.numero == numero) {
        return conta;
      }
    }
    return null;
  }

  /// Fechamento mensal: cobra a taxa de manutenção e aplica o rendimento de
  /// todas as contas.
  ///
  /// As duas linhas do `for` são iguais para todos os tipos de conta; quem
  /// muda de comportamento é o objeto, graças ao polimorfismo.
  void fechamentoMensal() {
    for (final conta in _contas) {
      conta.aplicarTaxa();
      conta.aplicarRendimento();
    }
  }

  /// Remove pontos e traços do CPF para padronizar a busca.
  static String _normalizarCpf(String cpf) =>
      cpf.replaceAll('.', '').replaceAll('-', '').trim();
}
