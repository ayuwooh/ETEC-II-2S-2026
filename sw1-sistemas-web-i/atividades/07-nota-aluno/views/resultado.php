<?php require_once __DIR__ . '/../controllers/controller.php'; ?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado</title>
</head>
<body>
    <main>
        <h1>Resultado</h1>
        <?php if (isset($aluno)): ?>
            <p><strong>Nome:</strong> <?= $nome ?></p>
            <p><strong>Média:</strong> <?= number_format($aluno->getMedia(), 2) ?></p>
            <p><strong>Presença:</strong> <?= number_format($presenca, 1) ?>%</p>
            <p><strong>Resultado:</strong> <?= $resultado ?></p>
        <?php else: ?>
            <p>Nenhum dado enviado.</p>
        <?php endif; ?>
        <a href="../index.html">Voltar</a>
    </main>
</body>
</html>