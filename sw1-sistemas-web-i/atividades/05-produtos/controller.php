<?php
require_once 'produto.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $calc = new product();

    $product = ($_POST['product'] ?? 0);
    $calc->setPrice($_POST['price'] ?? 0);
    $calc->setQuantity($_POST['quantity'] ?? 0);
    $calc->setDiscount($_POST['discount'] ?? 0);
    $lowstock = $calc->lowStock();

    $result = $calc->calc();
}