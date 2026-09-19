<?php

require_once "../model/ContaModel.php";

$a = new ContaBancaria();
$a->setTitular("Juju");
$a->depositar(6767.00);

$b = new ContaBancaria();
$b->setTitular("Yuyu");
$b->depositar(6969.00);

$c = new ContaBancaria();
$c->setTitular("Wiwi");
$c->depositar(420.00);

$contas = [$a, $b, $c];