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
        <?php if (isset($result)): ?>
            <p><?php echo "Produto: " . $product?></p>
            <p><?php echo "Preço: R$ " . number_format($result, 2, ',', '.'); ?></p>
            <?php if ($lowstock): ?>
                <p class="estoque">Estoque Baixo!</p>
            <?php endif; ?>
            <a href="index.html">Cadastrar outro Produto</a>
        <?php else: ?>
            <p>Envie o formulário para calcular.</p>
            <a href="index.html">Ir para página inicial</a>
        <?php endif; ?>
    </div>
</body>
</html>