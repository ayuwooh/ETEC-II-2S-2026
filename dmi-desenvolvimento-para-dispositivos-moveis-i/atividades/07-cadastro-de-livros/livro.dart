class Livro {
  String titulo;
  String autor;
  int anoPublicacao;

  Livro(this.titulo, this.autor, this.anoPublicacao);

  void exibirInformacoes() {
    print('Título: $titulo');
    print('Autor: $autor');
    print('Ano de Publicação: $anoPublicacao');
  }
}
