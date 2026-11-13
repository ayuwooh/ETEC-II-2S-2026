<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-B/GM4XqrwHnWXNOWMbloTmrYXZg10cakYGmpfsR/bbzQ6JAJI4ihuyADKLnBgrCe" crossorigin="anonymous">
    <script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-1a/pXj49ZQ1aHEmrJ+gMw1otqoVsYwlEnlD8mIfY2TV03r20Y0CN7uqx1tQogjPL" crossorigin="anonymous"></script>
</head>

<body>
    <h1>Usuários</h1>
    <hr>
    <div>
        <table style="top:40px">
            <thead>
                <tr>
                    <th>Login</th>
                    <th>Permissão</th>
                    <th><a href="index.php?action=cadUsuario">Novo</a></th>
                </tr>
            </thead>
            <tbody>
                <?php
                require_once __DIR__ . '/../controller/UsuarioController.php';

                $usuarios = call_user_func(array('UsuarioController', 'listar'));

                if (isset($usuarios) && !empty($usuarios)) {
                    foreach ($usuarios as $usuario) {
                ?>
                        <tr>
                            <td><?php echo $usuario->getLogin(); ?></td>
                            <td><?php echo $usuario->getPermissao(); ?></td>
                            <td>
                                <a href="index.php?action=editarUsuario&id=<?php echo $usuario->getId(); ?>">Editar</a>
                                <a href="index.php?action=excluirUsuario&id=<?php echo $usuario->getId(); ?>">Excluir</a>
                            </td>
                        </tr>
                    <?php
                    }
                } else {
                    ?>
                    <tr>
                        <td colspan="5">Nenhum registro encontrado</td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>