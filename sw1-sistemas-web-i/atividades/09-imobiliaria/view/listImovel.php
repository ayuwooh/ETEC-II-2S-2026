<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Imóveis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-B/GM4XqrwHnWXNOWMbloTmrYXZg10cakYGmpfsR/bbzQ6JAJI4ihuyADKLnBgrCe" crossorigin="anonymous">
    <script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-1a/pXj49ZQ1aHEmrJ+gMw1otqoVsYwlEnlD8mIfY2TV03r20Y0CN7uqx1tQogjPL" crossorigin="anonymous"></script>
</head>

<body>
    <h1>Imóveis</h1>
    <hr>
    <div>
        <table style="top:40px">
            <thead>
                <tr>
                    <th>Descrição</th>
                    <th>Foto</th>
                    <th>Valor</th>
                    <th>Tipo</th>
                    <th><a href="cadImovel.php">Novo</a></th>
                </tr>
            </thead>
            <tbody>
                <?php
                require_once __DIR__ . '/../controller/ImovelController.php';

                $imoveis = call_user_func(array('ImovelController', 'listar'));

                if (isset($imoveis) && !empty($imoveis)) {
                    foreach ($imoveis as $imovel) {
                ?>
                        <tr>
                            <td><?php echo $imovel->getDescricao(); ?></td>
                            <td><?php echo $imovel->getFoto(); ?></td>
                            <td><?php echo $imovel->getValor(); ?></td>
                            <td><?php echo $imovel->getTipo(); ?></td>
                            <td>
                                <a href="index.php?action=editarImovel&id=<?php echo $imovel->getId(); ?>">Editar</a>
                                <a href="index.php?action=excluirImovel&id=<?php echo $imovel->getId(); ?>">Excluir</a>
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