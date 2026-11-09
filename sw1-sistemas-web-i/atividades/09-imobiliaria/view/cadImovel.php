<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Imovel</title>
</head>

<body>
    <form name="cadImovel" id="cadImovel" action="" method="post">
        Descrição: <input type="text" class="form-control col-sm-8" name="descricao" id="descricao" value="<?php echo isset($imovel) ? $imovel->getDescricao() : '' ?>"></br>
        Foto: <input type="text" class="form-control col-sm-8" name="foto" id="foto" value="<?php echo isset($imovel) ? $imovel->getFoto() : '' ?>"></br>
        Valor: <input type="number" step=".01" class="form-control col-sm-8" name="valor" id="valor" value="<?php echo isset($imovel) ? $imovel->getValor() : '' ?>"></br>
        <select class="form-control col-sm-8" name="tipo" id="tipo">
            <option value="0">Selecione</option>
            <option value="C" <?php echo isset($imovel) && $imovel->getTipo() == 'A' ? 'selected' : '' ?>>Casa</option>
            <option value="A" <?php echo isset($imovel) && $imovel->getTipo() == 'C' ? 'selected' : '' ?>>Apartamento</option>
            <option value="T" <?php echo isset($imovel) && $imovel->getTipo() == 'C' ? 'selected' : '' ?>>Terreno</option>
        </select><br />
        <input type="hidden" name="id" id="id" value="<?php echo isset($imovel) ? $imovel->getId() : '' ?>">
        <input type="submit" class="btn-default" name="btnSalvar" id="btnSalvar">
    </form>
</body>

<?php
if (isset($_POST['btnSalvar'])) {
    require_once __DIR__ . '/../controller/ImovelController.php';
    call_user_func(array('ImovelController', 'salvar'));
    header('Location: index.php?action=listar');
}
?>

</html>