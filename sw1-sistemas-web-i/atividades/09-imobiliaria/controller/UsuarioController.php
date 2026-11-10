<?php

require_once __DIR__ . '/../model/usuario.php';

class UsuarioController
{
    static public function salvar()
    {
        $usuario = new Usuario();

        $usuario->setId($_POST['id']);
        $usuario->setLogin($_POST['login']);
        $usuario->setSenha($_POST['senha1']);
        $usuario->setPermissao($_POST['permissao']);

        $usuario->save();
    }

    static public function listar()
    {
        $usuarios = new Usuario();
        return $usuarios->listAll();
    }

    static public function editar($id)
    {
        $usuario = new Usuario();
        $usuario = $usuario->find($id);
        return $usuario;
    }

    static public function excluir($id)
    {
        $usuario = new Usuario();
        $usuario = $usuario->remove($id);
    }
}
