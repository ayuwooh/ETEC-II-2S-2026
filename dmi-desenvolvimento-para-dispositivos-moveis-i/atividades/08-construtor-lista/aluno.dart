import 'dart:io';

class Aluno {
  String nome;
  String ra;
  Set<String> linguagem;
  List<double> notas;

  Aluno(this.nome, this.ra, this.linguagem, this.notas);

  @override
  String toString() =>
      'nome: $nome | ra: $ra | linguagens: $linguagem | notas: $notas';
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

    print('Digite as linguagens que o aluno domina (separadas por vírgula):');
    var linguagem = (stdin.readLineSync() ?? '')
        .split(',')
        .map((s) => s.trim())
        .toSet();

    var notas = <double>[];
    while (true) {
      print('Adicione uma nota (ou "sair" para encerrar):');
      var entrada = stdin.readLineSync() ?? '';
      if (entrada.trim().isEmpty || entrada.trim().toLowerCase() == 'sair') {
        break;
      }

      var valor = double.tryParse(entrada.trim().replaceAll(',', '.'));
      if (valor == null) {
        print('Nota inválida. Use números como 8,5');
        continue;
      }

      notas.add(valor);
      print('Nota registrada: $valor');
    }

    var aluno = Aluno(nome, ra, linguagem, notas);
    alunos.add(aluno);
    print(aluno);
    print('');
  }

  print('${alunos.length} aluno(s) cadastrado(s).');
}