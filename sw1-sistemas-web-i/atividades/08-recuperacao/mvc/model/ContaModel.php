<?php

class ContaBancaria {
    private $titular;
    private $saldo;

    public function setTitular($nome) {
        $this->titular = $nome;
    }

    public function getTitular() {
        return $this->titular;
    }

    public function depositar($valor) {
        $this->saldo += $valor;
    }

    public function consultarSaldo() {
        return $this->saldo;
    }

    public function sacar($valor) {
        if ($this->saldo >= $valor) {
            $this->saldo -= $valor;
        } else {
            echo "Saldo insuficiente.<br/>";
        }
    }
}
