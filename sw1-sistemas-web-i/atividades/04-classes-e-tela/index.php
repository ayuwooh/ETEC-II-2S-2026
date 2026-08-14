<?php

require_once 'operacao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST'){

    $minhaConta = new Operacao();

    $minhaConta->setValor1($_POST['valor1'] ?? 0);
    $minhaConta->setValor2($_POST['valor2'] ?? 0);

    if ($_POST['operacao']==1){
        echo "Soma: " . $minhaConta->somar() . "<br>";
    } elseif ($_POST['operacao']==2){
        echo "Subtração: " . $minhaConta->subtrair() . "<br>";
    } elseif ($_POST['operacao']==3){
        echo "Multiplicação: " . $minhaConta->multiplicar() . "<br>";
    } elseif ($_POST['operacao']==4){
        echo "Divisão: " . $minhaConta->dividir() . "<br>";
    } else {
        echo "Exponenciação: " . $minhaConta->exponenciar() . "<br>";
    } 
}