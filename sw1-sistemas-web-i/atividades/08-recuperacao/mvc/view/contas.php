<?php
require_once "../controller/ContaController.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table>
        <tr>
            <th>Titular</th>
            <th>Saldo</th>
        </tr>
        <?php foreach ($contas as $conta): ?>
        <tr>
            <td><?php echo $conta->getTitular() ?></td>
            <td><?php echo $conta->consultarSaldo() ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>