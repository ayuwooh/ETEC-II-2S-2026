<?php

require_once 'operacao.php';

$minhaConta = new Operacao();

$minhaConta->setValor1(69);
$minhaConta->setValor2(67);

echo "Soma: " . $minhaConta->somar() . "<br>";
echo "Subtração: " . $minhaConta->subtrair() . "<br>";
echo "Multiplicação: " . $minhaConta->multiplicar() . "<br>";
echo "Divisão: " . $minhaConta->dividir() . "<br>";
echo "Exponenciação: " . $minhaConta->exponenciar() . "<br>";