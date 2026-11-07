<?php

require_once __DIR__ . '/../model/usuario.php';

class UsuarioController
{
    public function salvar()
    {
        $usuario = new Usuario();

        $usuario->setId($_POST['id']);
        $usuario->setLogin($_POST['login']);
        $usuario->setSenha($_POST['senha1']);
        $usuario->setPermissao($_POST['permissao']);

        $usuario->save();
    }

    public function listar()
    {
        $usuarios = new Usuario();
        return $usuarios->listAll();
    }

    public function editar($id)
    {
        $usuario = new Usuario();
        $usuario = $usuario->find($id);
        return $usuario;
    }

    public function excluir($id)
    {
        $usuario = new Usuario();
        $usuario = $usuario->remove($id);
    }
}
