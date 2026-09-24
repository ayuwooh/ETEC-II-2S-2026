import 'dart:io';

class Livro {
    String titulo = "";
    String autor = "";

    void setTitulo(titulo){
        this.titulo = titulo;    
    }

    String getTitulo(){
        return this.titulo;    
    }

    void setAutor(autor){
        this.autor = autor;    
    }

    String getAutor(){
        return this.autor;
    }
}

void main(){
    print('Digite o título do livro:');
    String titulo = stdin.readLineSync()!;

    print('Digite o nome do autor:');
    String autor = stdin.readLineSync()!;

    Livro a = Livro();

    a.setTitulo(titulo);
    a.setAutor(autor);

    print('Titulo: ${a.getTitulo()}');
    print('Autor: ${a.getAutor()}');
}