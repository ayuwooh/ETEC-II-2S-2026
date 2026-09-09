import 'dart:io';

void main() {
  const double depreciacaoAnual = 10.0;
  const double depreciacaoPorMilKm = 1.0;

  print('=== Cálculo de depreciação de automóvel ===');
  print('Digite o ano de lançamento do automóvel:');
  int anoLancamento = int.parse(stdin.readLineSync()!);

  print('Digite o valor do automóvel no ano de lançamento:');
  double valorInicial = double.parse(
    stdin.readLineSync()!.replaceAll(',', '.'),
  );

  int anoCalculo;
  do {
    print('Digite o ano em que deseja calcular a depreciação:');
    anoCalculo = int.parse(stdin.readLineSync()!);

    if (anoCalculo < anoLancamento) {
      print('Erro: o ano desejado não pode ser menor que o ano de lançamento.');
    }
  } while (anoCalculo < anoLancamento);

  print('Digite o valor do automóvel no ano de $anoCalculo:');
  double anoValor = double.parse(
    stdin.readLineSync()!.replaceAll(',', '.'),
  );
  print('Digite a quilometragem rodada desde o lançamento:');
  double quilometragem = double.parse(
    stdin.readLineSync()!.replaceAll(',', '.'),
  );

  if (valorInicial < 0 || quilometragem < 0) {
    print('Erro: o valor e a quilometragem não podem ser negativos.');
    return;
  }

  int quantidadeAnos = anoCalculo - anoLancamento;
  //Depreciação em R$
  double depreciacao =  valorInicial - anoValor;

  // Depreciação anual simples: 10% do valor inicial por ano.
  double percentualAnual = (depreciacao/valorInicial) * 100;
  if (percentualAnual > 100) { 
      percentualAnual = 100;
  }

  double valorAposAnos = depreciacao/quantidadeAnos;

  // Depreciação por quilometragem: 1% a cada 1.000 km.
  double depreciacaoKm = (depreciacao/quilometragem);
  if (depreciacaoKm > 100) {
    depreciacaoKm = 100;
  }
  depreciacaoKm *= quilometragem;
  double valorFinal = valorInicial - (depreciacao + (depreciacaoKm / 100));
  double percentualTotal = 100 - (valorFinal / valorInicial * 100);
  double percentualMedioPorAno = quantidadeAnos == 0
      ? 0
      : percentualTotal / quantidadeAnos;

  print('\n=== Resultado ===');
  print('Anos de uso: $quantidadeAnos ano(s)');
  print('Valor da depreciação: ${depreciacao.toStringAsFixed(2)}');
  print('Depreciação por tempo: ${percentualAnual.toStringAsFixed(2)}%');
  print('Depreciação por quilometragem: ${depreciacaoKm.toStringAsFixed(2)}%');
  print('Percentual total de depreciação: ${percentualTotal.toStringAsFixed(2)}%');
  print('Percentual médio de depreciação por ano: '
      '${percentualMedioPorAno.toStringAsFixed(2)}%');
  print('Valor do automóvel no ano $anoCalculo: '
      'R\$ ${valorFinal.toStringAsFixed(2)}');
}
