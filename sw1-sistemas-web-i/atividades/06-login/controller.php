<?php

require_once 'models/login.php';

$auth = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $login = new Login();

    if (isset($_POST['user']) && isset($_POST['password'])) {
        $user = trim($_POST['user']);
        $password = $_POST['password'];

        if ($user === $login->getUser() && $login->verify($password)) {
            $auth = true;
        }
    }
}
