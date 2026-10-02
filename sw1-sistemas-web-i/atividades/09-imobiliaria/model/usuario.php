<?php

require_once 'banco.php';
require_once '../conexao.php';

class Usuario extends Banco {
    private $id;
    private $login;
    private $senha;
    private $permissao;

    public function getId() {
        return $this->id;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function getLogin() {
        return $this->login;
    }

    public function setLogin($login) {
        $this->login = $login;
    }

    public function getSenha() {
        return $this->senha;
    }

    public function setSenha($senha) {
        $this->senha = $senha;
    }

    public function getPermissao() {
        return $this->permissao;
    }

    public function setPermissao($permissao) {
        $this->permissao = $permissao;
    }

    public function save() {
        $result = false;
        $conexao = new Conexao();
        $query = 'insert into usuario (id, login, senha, permissao) values (null,:login,:senha,:permissao';

        if ($conn = $conexao->getConnection()) {
            $stmt = $conn->prepare($query);
            if ($stmt->execute(array(':login' => $this->login, ':senha' => $this->senha, ':permissao' => $this->permissao))) {
                $result = $stmt->rowCount();
            }
        }
    }

    public function listAll()
    {
        $conexao = new Conexao();
        $conn = $conexao->getConnection();
        $query = 'SELECT * FROM usuario';
        $stmt = $conn->prepare($query);
        $result = array();
        
        if ($stmt->execute()) {
            while ($rs = $stmt->fetchObject(Usuario::class)) {
                $result[] = $rs;
            }
        } else {
            $result = false;
        }

        return $result;
    }
}