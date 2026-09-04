<?php require_once 'controller.php'; ?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="resultado">
        <?php if ($auth): ?>
            <p>Login bem sucedido.</p>
        <?php else: ?>
            <p>Usuário ou senha inválidos. <a href="index.html">Tentar novamente</a>.</p>
        <?php endif; ?>
    </div>
</body>
</html>
