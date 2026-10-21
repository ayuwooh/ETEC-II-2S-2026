import 'excecoes.dart';

/// Cliente do banco.
///
/// Encapsulamento em ação: os dados ficam privados (`_`) e só entram ou saem
/// por *getters* e *setters*, que validam o que é informado.
class Cliente {
  final String _cpf;
  String _nome;
  String _email;

  Cliente({
    required String cpf,
    required String nome,
    required String email,
  })  : _cpf = cpf,
        _nome = _validarNome(nome),
        _email = _validarEmail(email);

  /// CPF do cliente (não muda).
  String get cpf => _cpf;

  /// Nome do cliente.
  String get nome => _nome;

  set nome(String valor) => _nome = _validarNome(valor);

  /// E-mail do cliente.
  String get email => _email;

  set email(String valor) => _email = _validarEmail(valor);

  /// Validação usada pelo construtor e pelo *setter* de nome.
  static String _validarNome(String valor) {
    final limpo = valor.trim();
    if (limpo.length < 3) {
      throw ValorInvalidoException('nome inválido: use ao menos 3 letras');
    }
    return limpo;
  }

  /// Validação usada pelo construtor e pelo *setter* de e-mail.
  static String _validarEmail(String valor) {
    final limpo = valor.trim();
    if (!limpo.contains('@') || !limpo.contains('.')) {
      throw ValorInvalidoException('e-mail inválido: $valor');
    }
    return limpo;
  }

  @override
  String toString() => 'Cliente: $_nome | CPF: $_cpf | E-mail: $_email';
}
