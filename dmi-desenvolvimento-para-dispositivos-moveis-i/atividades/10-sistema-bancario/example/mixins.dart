import 'excecoes.dart';
import 'transacao.dart';

/// Mixin que guarda o histórico de movimentos da conta, ou seja, o extrato.
///
/// É um `mixin` simples: só pode ser usado com `with`, nunca estendido.
mixin Extrato {
  final List<Transacao> _historico = <Transacao>[];

  /// Registra um movimento no histórico.
  void registrar(Transacao transacao) => _historico.add(transacao);

  /// Extrato da conta, do movimento mais recente para o mais antigo.
  List<Transacao> get extrato =>
      List<Transacao>.unmodifiable(_historico.reversed);
}

/// Mixin class: autentica o acesso à conta por PIN.
///
/// Diferente de um `mixin` comum, um `mixin class` também pode ser usado
/// como superclasse (`extends`), e não apenas encaixado com `with`.
mixin class Autenticavel {
  bool _autenticado = false;

  /// `true` quando a última tentativa de autenticação deu certo.
  bool get autenticado => _autenticado;

  /// Tenta autenticar o acesso.
  ///
  /// O parâmetro [validador] confere o PIN informado e devolve `true` quando
  /// ele é o esperado. Assim o mixin não precisa conhecer a regra de negócio
  /// da conta: ele cuida apenas do estado da autenticação.
  void autenticar(bool Function(String pin) validador, String pinInformado) {
    _autenticado = validador(pinInformado);
    if (!_autenticado) {
      throw CredencialInvalidaException();
    }
  }
}
