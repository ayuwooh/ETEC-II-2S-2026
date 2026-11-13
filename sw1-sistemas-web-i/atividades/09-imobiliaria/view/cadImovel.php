<?php
if (isset($_POST['btnSalvar'])) {
    require_once __DIR__ . '/../controller/ImovelController.php';
    call_user_func(['ImovelController', 'salvar']);
    header('Location: index.php?action=listarImovel');
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Imovel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-B/GM4XqrwHnWXNOWMbloTmrYXZg10cakYGmpfsR/bbzQ6JAJI4ihuyADKLnBgrCe" crossorigin="anonymous">
    <script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-1a/pXj49ZQ1aHEmrJ+gMw1otqoVsYwlEnlD8mIfY2TV03r20Y0CN7uqx1tQogjPL" crossorigin="anonymous"></script>
</head>

<body>
    <form name="cadImovel" id="cadImovel" action="" method="post">
        Descrição: <input type="text" class="form-control col-sm-8" name="descricao" id="descricao" value="<?php echo isset($imovel) ? $imovel->getDescricao() : '' ?>"></br>
        Foto: <input type="text" class="form-control col-sm-8" name="foto" id="foto" value="<?php echo isset($imovel) ? $imovel->getFoto() : '' ?>"></br>
        Valor: <input type="number" step=".01" class="form-control col-sm-8" name="valor" id="valor" value="<?php echo isset($imovel) ? $imovel->getValor() : '' ?>"></br>
        <select class="form-control col-sm-8" name="tipo" id="tipo">
            <option value="0">Selecione</option>
            <option value="C" <?php echo isset($imovel) && $imovel->getTipo() == 'C' ? 'selected' : '' ?>>Casa</option>
            <option value="A" <?php echo isset($imovel) && $imovel->getTipo() == 'A' ? 'selected' : '' ?>>Apartamento</option>
            <option value="T" <?php echo isset($imovel) && $imovel->getTipo() == 'T' ? 'selected' : '' ?>>Terreno</option>
        </select><br />
        <input type="hidden" name="id" id="id" value="<?php echo isset($imovel) ? $imovel->getId() : '' ?>">
        <input type="submit" class="btn-default" name="btnSalvar" id="btnSalvar">
    </form>
</body>

</html>