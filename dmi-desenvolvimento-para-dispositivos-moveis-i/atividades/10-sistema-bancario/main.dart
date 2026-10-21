import 'livro.dart';

void main() {
  Livro livro1 = Livro('O Hobbit', 'J. R. R. Tolkien', 1937);
  Livro livro2 = Livro('A Sociedade do Anel', 'J. R. R. Tolkien', 1954);

  print('=== Livro 1 ===');
  livro1.exibirInformacoes();

  print('\n=== Livro 2 ===');
  livro2.exibirInformacoes();
}
