import 'dart:io';

const pesos = [4.0, 4.0, 6.0, 6.0];

double media(List<double> notas) {
  var soma = 0.0;
  var somaPesos = 0.0;
  for (var i = 0; i < notas.length; i++) {
    soma += notas[i] * pesos[i];
    somaPesos += pesos[i];
  }
  return somaPesos == 0 ? 0 : soma / somaPesos;
}

class Aluno {
  String nome;
  String ra;
  Set<String> linguagem;
  Map<String, List<double>> notas;

  Aluno(this.nome, this.ra, this.linguagem, this.notas);

  double mediaGeral() {
    var soma = 0.0;
    var somaPesos = 0.0;
    for (var lista in notas.values) {
      for (var i = 0; i < lista.length; i++) {
        soma += lista[i] * pesos[i];
        somaPesos += pesos[i];
      }
    }
    return somaPesos == 0 ? 0 : soma / somaPesos;
  }

  @override
  String toString() {
    var linhas = ['nome: $nome | ra: $ra | linguagens: $linguagem'];
    for (var disciplina in notas.keys) {
      var lista = notas[disciplina]!;
      var status = lista.length < pesos.length ? ' (${lista.length}/4)' : '';
      linhas.add('  $disciplina: ${media(lista).toStringAsFixed(2)}$status');
    }
    linhas.add('  media geral: ${mediaGeral().toStringAsFixed(2)}');
    return linhas.join('\n');
  }
}

void main() {
  var alunos = <Aluno>[];

  while (true) {
    print('Bem-vindo ao cadastro de aluno.');

    print('Digite o nome do aluno (ou "sair" para encerrar):');
    var nome = stdin.readLineSync() ?? '';
    if (nome.toLowerCase() == 'sair') break;

    print('Digite o RA do aluno:');
    var ra = stdin.readLineSync() ?? '';

    print('Linguagens que domina (separadas por vírgula):');
    var linguagem = (stdin.readLineSync() ?? '')
        .split(',')
        .map((s) => s.trim())
        .toSet();

    var notas = <String, List<double>>{};
    while (true) {
      print('Disciplina (ou "sair" para voltar):');
      var disciplina = stdin.readLineSync() ?? '';
      if (disciplina.toLowerCase() == 'sair') break;

      disciplina = disciplina.trim();
      if (disciplina.isEmpty) continue;

      var lista = notas[disciplina] ?? <double>[];
      while (lista.length < pesos.length) {
        print('Nota ${lista.length + 1}/${pesos.length}:');
        var entrada = stdin.readLineSync() ?? '';
        if (entrada.isEmpty || entrada.toLowerCase() == 'sair') break;

        var valor = double.tryParse(entrada.replaceAll(',', '.'));
        if (valor == null) {
          print('Nota inválida. Use números como 8,5');
          continue;
        }

        lista.add(valor);
      }
      notas[disciplina] = lista;
    }

    var aluno = Aluno(nome, ra, linguagem, notas);
    alunos.add(aluno);
    print(aluno);
    print('');
  }

  print('${alunos.length} aluno(s) cadastrado(s).');
}