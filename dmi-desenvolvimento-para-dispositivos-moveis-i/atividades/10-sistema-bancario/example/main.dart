import 'dart:io';

import 'banco.dart';
import 'cliente.dart';
import 'conta.dart';
import 'excecoes.dart';
import 'transacao.dart';

/// Ponto de entrada da aplicação: o menu do banco.
void main() {
  final Banco banco = Banco();
  var continuar = true;

  while (continuar) {
    print('');
    print('===== ${Banco.nome} =====');
    print('1. Cadastrar cliente');
    print('2. Abrir conta');
    print('3. Depositar');
    print('4. Sacar');
    print('5. Transferir');
    print('6. Extrato da conta');
    print('7. Contas do banco');
    print('8. Fechamento mensal');
    print('9. Sair');

    switch (_ler('Opção: ')) {
      case '1':
        _cadastrarCliente(banco);
      case '2':
        _abrirConta(banco);
      case '3':
        _depositar(banco);
      case '4':
        _sacar(banco);
      case '5':
        _transferir(banco);
      case '6':
        _mostrarExtrato(banco);
      case '7':
        _mostrarContas(banco);
      case '8':
        _fechamentoMensal(banco);
      case '9':
        continuar = false;
        print('Obrigado por usar o ${Banco.nome}!');
      default:
        print('Opção inválida.');
    }
  }
}

void _cadastrarCliente(Banco banco) {
  print('');
  try {
    final cliente = banco.cadastrarCliente(
      cpf: _ler('CPF: '),
      nome: _ler('Nome completo: '),
      email: _ler('E-mail: '),
    );
    print('Cliente cadastrado: $cliente');
  } on OperacaoBancariaException catch (e) {
    print('Erro: ${e.mensagem}');
  }
}

void _abrirConta(Banco banco) {
  print('');
  if (banco.clientes.isEmpty) {
    print('Cadastre um cliente antes de abrir uma conta.');
    return;
  }

  try {
    print('Titulares cadastrados:');
    for (var i = 0; i < banco.clientes.length; i++) {
      print('${i + 1}. ${banco.clientes[i]}');
    }

    final indice = _lerInt('Escolha o titular: ');
    if (indice == null || indice < 1 || indice > banco.clientes.length) {
      print('Titular inválido.');
      return;
    }
    final Cliente titular = banco.clientes[indice - 1];

    print('1. Conta Corrente (cheque especial e taxa de 2% ao mês)');
    print('2. Conta Poupança (rendimento de 1% ao mês)');
    final tipo = _ler('Tipo de conta: ') == '2'
        ? TipoConta.poupanca
        : TipoConta.corrente;

    final conta = banco.abrirConta(
      titular: titular,
      tipo: tipo,
      saldoInicial: _lerValorOpcional('Saldo inicial (opcional): R\$ '),
    );
    print('Conta aberta: $conta');
    print('PIN de acesso: ${Banco.pinPadrao}');
  } on OperacaoBancariaException catch (e) {
    print('Erro: ${e.mensagem}');
  }
}

void _depositar(Banco banco) {
  print('');
  final conta = _escolherConta(banco);
  if (conta == null) {
    return;
  }

  try {
    final valor = _lerValor('Valor do depósito: R\$ ');
    conta.depositar(valor);
    print('Depósito realizado. Saldo: ${Banco.formatarMoeda(conta.saldo)}');
  } on OperacaoBancariaException catch (e) {
    print('Erro: ${e.mensagem}');
  }
}

void _sacar(Banco banco) {
  print('');
  final conta = _escolherConta(banco);
  if (conta == null) {
    return;
  }

  try {
    // Autenticação por PIN: o mixin cuida do estado da autenticação.
    conta.autenticar(conta.validarPin, _ler('PIN da conta: '));
    final valor = _lerValor('Valor do saque: R\$ ');
    conta.sacar(valor);
    print('Saque realizado. Saldo: ${Banco.formatarMoeda(conta.saldo)}');
  } on OperacaoBancariaException catch (e) {
    print('Erro: ${e.mensagem}');
  }
}

void _transferir(Banco banco) {
  print('');
  final origem = _escolherConta(banco);
  if (origem == null) {
    return;
  }
  final destino = _escolherConta(banco, ignorar: origem);
  if (destino == null) {
    return;
  }

  try {
    final valor = _lerValor('Valor da transferência: R\$ ');
    origem.transferir(destino, valor);
    print('Transferência concluída.');
    print('Origem : ${Banco.formatarMoeda(origem.saldo)}');
    print('Destino: ${Banco.formatarMoeda(destino.saldo)}');
  } on OperacaoBancariaException catch (e) {
    print('Erro: ${e.mensagem}');
  }
}

void _mostrarExtrato(Banco banco) {
  print('');
  final conta = _escolherConta(banco);
  if (conta == null) {
    return;
  }

  print('=== Extrato ${conta.tipoConta} ${conta.numero} ===');
  if (conta.extrato.isEmpty) {
    print('(nenhum movimento registrado)');
  } else {
    for (final Transacao transacao in conta.extrato) {
      print(transacao);
    }
  }
  print('Saldo atual: ${Banco.formatarMoeda(conta.saldo)}');
}

void _mostrarContas(Banco banco) {
  print('');
  print('=== Contas (${banco.totalDeContas}) ===');
  for (final Conta conta in banco.contas) {
    print(conta);
  }
  print('Saldo total: ${Banco.formatarMoeda(banco.saldoTotal)}');
}

void _fechamentoMensal(Banco banco) {
  print('');
  try {
    print('Antes do fechamento:');
    for (final Conta conta in banco.contas) {
      print('  ${conta.tipoConta} ${conta.numero}: '
          '${Banco.formatarMoeda(conta.saldo)}');
    }

    banco.fechamentoMensal();

    print('Depois do fechamento:');
    for (final Conta conta in banco.contas) {
      print('  ${conta.tipoConta} ${conta.numero}: '
          '${Banco.formatarMoeda(conta.saldo)}');
    }
  } on OperacaoBancariaException catch (e) {
    print('Erro: ${e.mensagem}');
  }
}

// -------------------------------------------------------------------
// Funções auxiliares de entrada e saída
// -------------------------------------------------------------------

/// Lê uma linha do teclado. O `?? ''` evita que o programa quebre quando o
/// usuário encerra a entrada (Ctrl+D).
String _ler(String pergunta) {
  stdout.write(pergunta);
  return (stdin.readLineSync() ?? '').trim();
}

/// Lê um inteiro. Devolve `null` quando o texto não é um número.
int? _lerInt(String pergunta) {
  final valor = int.tryParse(_ler(pergunta));
  if (valor == null) {
    print('Digite um número inteiro.');
  }
  return valor;
}

/// Lê um valor monetário, aceitando vírgula ou ponto como separador decimal.
double _lerValor(String pergunta) {
  while (true) {
    final valor = double.tryParse(_ler(pergunta).replaceAll(',', '.'));
    if (valor != null) {
      return valor;
    }
    print('Valor inválido. Use números como 150,50');
  }
}

/// Lê um valor monetário opcional: texto vazio significa zero.
double _lerValorOpcional(String pergunta) {
  final texto = _ler(pergunta);
  return double.tryParse(texto.replaceAll(',', '.')) ?? 0;
}

/// Mostra as contas e devolve a escolhida, ou `null` se a escolha for inválida.
Conta? _escolherConta(Banco banco, {Conta? ignorar}) {
  if (banco.contas.isEmpty) {
    print('Nenhuma conta aberta até o momento.');
    return null;
  }

  print('Contas disponíveis:');
  for (var i = 0; i < banco.contas.length; i++) {
    print('${i + 1}. ${banco.contas[i]}');
  }

  final indice = _lerInt('Escolha a conta: ');
  if (indice == null || indice < 1 || indice > banco.contas.length) {
    print('Conta inválida.');
    return null;
  }

  final Conta escolhida = banco.contas[indice - 1];
  if (escolhida.numero == ignorar?.numero) {
    print('Escolha outra conta (não é possível transferir para ela mesma).');
    return null;
  }
  return escolhida;
}
