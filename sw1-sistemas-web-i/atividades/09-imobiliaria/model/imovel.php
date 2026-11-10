<?php

require_once 'banco.php';
require_once __DIR__ . '/../conexao.php';

class Imovel extends Banco
{
    private $id;
    private $descricao;
    private $foto;
    private $valor;
    private $tipo;

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getDescricao()
    {
        return $this->descricao;
    }

    public function setDescricao($descricao)
    {
        $this->descricao = $descricao;
    }

    public function getFoto()
    {
        return $this->foto;
    }

    public function setFoto($foto)
    {
        $this->foto = $foto;
    }

    public function getValor()
    {
        return $this->valor;
    }

    public function setValor($valor)
    {
        $this->valor = $valor;
    }

    public function getTipo()
    {
        return $this->tipo;
    }

    public function setTipo($tipo)
    {
        $this->tipo = $tipo;
    }

    public function save()
    {
        $result = false;

        $conexao = new Conexao();

        if ($conn = $conexao->getConnection()) {
            if ($this->id > 0) {
                $query = "UPDATE imovel SET descricao = :descricao, foto = :foto, valor = :valor, tipo = :tipo WHERE id = :id";
                $stmt = $conn->prepare($query);
                if ($stmt->execute(array(':descricao' => $this->descricao, ':foto' => $this->foto, ':valor' => $this->valor, ':tipo' => $this->tipo, ':id' => $this->id))) {
                    $result = $stmt->rowCount();
                }
            } else {
                $query = 'insert into imovel (id, descricao, foto, valor, tipo) values (null,:descricao,:foto,:valor,:tipo)';
                $stmt = $conn->prepare($query);
                if ($stmt->execute(array(':descricao' => $this->descricao, ':foto' => $this->foto, ':valor' => $this->valor, ':tipo' => $this->tipo))) {
                    $result = $stmt->rowCount();
                }
            }
        }
        return $result;
    }

    public function count() {}

    public function listAll() {}

    public function find($id) {}

    public function remove($id) {}
}
