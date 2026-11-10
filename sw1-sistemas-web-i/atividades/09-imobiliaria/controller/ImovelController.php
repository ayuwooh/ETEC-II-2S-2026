<?php

require_once __DIR__ . '/../model/imovel.php';

class ImovelController
{
    static public function salvar()
    {
        $imovel = new Imovel();

        $imovel->setId($_POST['id']);
        $imovel->setDescricao($_POST['descricao']);
        $imovel->setFoto($_POST['foto']);
        $imovel->setValor($_POST['valor']);
        $imovel->setTipo($_POST['tipo']);

        $imovel->save();
    }

    static public function listar()
    {
        $imovel = new Imovel();
        return $imovel->listAll();
    }

    static public function editar($id)
    {
        $imovel = new Imovel();
        $imovel = $imovel->find($id);
        return $imovel;
    }

    static public function excluir($id)
    {
        $imovel = new Imovel();
        $imovel = $imovel->remove($id);
    }
}
