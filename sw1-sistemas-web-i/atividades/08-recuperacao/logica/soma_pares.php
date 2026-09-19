<?php

$soma = 0;

for ($i = 1; $i <= 50; $i++) {
    if ($i % 2 == 0) {
        $soma += $i;
    }
}
echo "Soma: " . $soma;