<?php

require_once "ContaBancaria.php";

$a = new ContaBancaria();
$a->setTitular("Juju");
echo "<h3>" . $a->getTitular() . "</h3>";
$a->depositar(6767.00);
echo "Saldo: " . $a->consultarSaldo() . "<br/>";
$a->sacar(666.00);
echo "Saldo: " . $a->consultarSaldo() . "<br/>";
$a->sacar(555555.00);
echo "Saldo: " . $a->consultarSaldo() . "<br/>";

$b = new ContaBancaria();
$b->setTitular("Yuyu");
echo "<h3>" . $b->getTitular() . "</h3>";
$b->depositar(6969.00);
echo "Saldo: " . $b->consultarSaldo() . "<br/>";
$b->sacar(420.00);
echo "Saldo: " . $b->consultarSaldo() . "<br/>";
$b->sacar(696969.00);
echo "Saldo: " . $b->consultarSaldo() . "<br/>";