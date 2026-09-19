<?php

$quantidade = 67;

if ($quantidade >= 10) {
    echo '20% de desconto.';
} elseif ($quantidade >= 5 && $quantidade <= 9) {
    echo '10% de desconto.';
} else {
    echo 'Sem desconto.';
}
