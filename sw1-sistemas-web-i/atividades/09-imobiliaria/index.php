<?php
require_once 'controller/usuarioController.php';
require_once 'controller/ImovelController.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-B/GM4XqrwHnWXNOWMbloTmrYXZg10cakYGmpfsR/bbzQ6JAJI4ihuyADKLnBgrCe" crossorigin="anonymous">
    <script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-1a/pXj49ZQ1aHEmrJ+gMw1otqoVsYwlEnlD8mIfY2TV03r20Y0CN7uqx1tQogjPL" crossorigin="anonymous"></script>
</head>

<body>
    <?php
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'editar') {
            //Chama uma função PHP que permite informar a classe e o Método que será acionado
            $usuario = call_user_func(array('usuarioController', 'editar'), $_GET['id']);
            require_once 'view/cadUsuario.php';
        }
        if ($_GET['action'] == 'listar') {
            require_once 'view/listUsuario.php';
        }

        if ($_GET['action'] == 'excluir') {
            //Chama uma função PHP que permite informar a classe e o Método que será acionado
            $usuario = call_user_func(array('usuarioController', 'excluir'), $_GET['id']);
            require_once 'view/listUsuario.php';
        }
        if ($_GET['action'] == 'cadImovel') {
            require_once 'view/cadImovel.php';
        }
    } else {
        require_once 'view/cadUsuario.php';
    }
    ?>
</body>

</html>