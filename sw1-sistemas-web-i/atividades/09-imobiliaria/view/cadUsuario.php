<?php
if (isset($_POST['btnSalvar'])) {
    require_once __DIR__ . '/../controller/UsuarioController.php';
    call_user_func(array('UsuarioController', 'salvar'));
    header('Location: index.php?action=listarUsuario');
}
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
    <form name="cadUsuario" id="cadUsuario" action="" method="post">
        Login: <input type="text" class="form-control col-sm-8" name="login" id="login" value="<?php echo isset($usuario) ? $usuario->getLogin() : '' ?>"></br>
        Senha: <input type="password" class="form-control col-sm-8" name="senha1" id="senha1" value="<?php echo isset($usuario) ? $usuario->getSenha() : '' ?>"></br>
        Repetir Senha: <input type="password" class="form-control col-sm-8" name="senha2" id="senha2"></br>
        <select class="form-control col-sm-8" name="permissao" id="permissao">
            <option value="0">Selecione</option>
            <option value="A" <?php echo isset($usuario) && $usuario->getPermissao() == 'A' ? 'selected' : '' ?>>Administrador</option>
            <option value="C" <?php echo isset($usuario) && $usuario->getPermissao() == 'C' ? 'selected' : '' ?>>Comum</option>
        </select><br />
        <input type="hidden" name="id" id="id" value="<?php echo isset($usuario) ? $usuario->getId() : '' ?>">
        <input type="submit" class="btn-default" name="btnSalvar" id="btnSalvar">
    </form>
</body>

</html>