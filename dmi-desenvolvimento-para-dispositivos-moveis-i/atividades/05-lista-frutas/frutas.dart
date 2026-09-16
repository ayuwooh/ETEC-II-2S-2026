import 'dart:io';

List<String> frutas = [];

void main() {
  while (true) {
    print("Você deseja registrar, remover ou consultar frutas? (ou 'sair')");
    String? choice = stdin.readLineSync()!.trim().toLowerCase();
    if (choice == 'registrar') {
      register();
    } else if (choice == 'consultar') {
      consult();
    } else if (choice == 'remover') {
      remove();
    } else if (choice == 'sair') {
      break;
    } else {
      print("Opção inválida.");
    }
  }
}

void register() {
  print("Quantas frutas você quer registrar?");
  int qty = int.parse(stdin.readLineSync()!);

  for (var count = 0; count < qty; count++) {
    print("----------");
    print("Digite o nome da fruta:");
    String fruta = stdin.readLineSync()!.trim();
    frutas.add(fruta);
    print("$fruta registrada.");
  }
  print("Todas as frutas registradas. Total: ${frutas.length}");
}

void consult() {
  print("----------");
  print("Quantidade de frutas: ${frutas.length}");

  if (frutas.isNotEmpty) {
    print("Primeira fruta cadastrada: ${frutas.first}");
  }

  for (var fruta in frutas) {
    print("- $fruta");
  }
}

void remove() {
  print("----------");
  frutas.forEach((fruta) => print("- $fruta"));
  print("----------");
  print("Que fruta deseja remover?");
  String userInput = stdin.readLineSync()!.trim();

  if (frutas.contains(userInput)) {
    frutas.remove(userInput);
    print("$userInput removida!");
  } else {
    print("Não foi possível encontrar esta fruta.");
  }

  print("Frutas restantes: ${frutas.length}");
}