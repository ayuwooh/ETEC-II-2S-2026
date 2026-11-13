<?php
require_once __DIR__ . '/controller/UsuarioController.php';
require_once __DIR__ . '/controller/ImovelController.php';
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
        if ($_GET['action'] == 'cadUsuario') {
            require_once 'view/cadUsuario.php';
        }
        if ($_GET['action'] == 'editarUsuario') {
            //Chama uma função PHP que permite informar a classe e o Método que será acionado
            $usuario = call_user_func(['UsuarioController', 'editar'], $_GET['id']);
            require_once 'view/cadUsuario.php';
        }
        if ($_GET['action'] == 'listarUsuario') {
            require_once 'view/listUsuario.php';
        }
        if ($_GET['action'] == 'excluirUsuario') {
            //Chama uma função PHP que permite informar a classe e o Método que será acionado
            $usuario = call_user_func(['UsuarioController', 'excluir'], $_GET['id']);
            require_once 'view/listUsuario.php';
        }

        if ($_GET['action'] == 'cadImovel') {
            require_once 'view/cadImovel.php';
        }
        if ($_GET['action'] == 'editarImovel') {
            $imovel = call_user_func(['ImovelController', 'editar'], $_GET['id']);
            require_once 'view/cadImovel.php';
        }
        if ($_GET['action'] == 'listarImovel') {
            require_once 'view/listImovel.php';
        }
        if ($_GET['action'] == 'excluirImovel') {
            //Chama uma função PHP que permite informar a classe e o Método que será acionado
            $imovel = call_user_func(['ImovelController', 'excluir'], $_GET['id']);
            require_once 'view/listImovel.php';
        }
    } else {
        require_once 'view/cadUsuario.php';
    }
?>
</body>

</html>