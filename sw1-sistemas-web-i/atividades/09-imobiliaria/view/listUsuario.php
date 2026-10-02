<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>
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
                    <th><a href="cadUsuario">Novo</a></th>
                </tr>
            </thead>
            <tbody>
                <?php
                    require_once '../controller/usuarioController.php';

                    $usuarios = call_user_func(array('UsuarioController','listar'));

                    if (isset($usuarios)) {
                        foreach ($usuarios as $usuario) {
                            ?>
                            <tr>
                                <td><?php echo $usuario->getLogin(); ?></td>
                                <td><?php echo $usuario->getPermissao(); ?></td>
                                <td>
                                    <a href="">Editar</a>
                                    <a href="">Excluir</a>
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