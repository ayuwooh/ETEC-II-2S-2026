<?php

$n1 = 67;
$n2 = 666;
$n3 = 420;
$maior = 0;

if ($n1 >= $n2 && $n1 >= $n3) {
    echo $n1 . " é o maior número.";
} else if ($n2 >= $n1 && $n2 >= $n3) {
    echo $n2 . " é o maior número.";
} else {
    echo $n3 . " é o maior número.";
}