<?php

require_once 'operacao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $minhaConta = new Operacao();

    $minhaConta->setValor1($_POST['valor1'] ?? 0);
    $minhaConta->setValor2($_POST['valor2'] ?? 0);

    $operacao = $_POST['operacao'] ?? 0;

    if ($operacao == 0) {
        $resultado = 'Selecione uma operação.';
    } elseif ($operacao == 1) {
        $resultado = 'Soma: ' . $minhaConta->somar();
    } elseif ($operacao == 2) {
        $resultado = 'Subtração: ' . $minhaConta->subtrair();
    } elseif ($operacao == 3) {
        $resultado = 'Multiplicação: ' . $minhaConta->multiplicar();
    } elseif ($operacao == 4) {
        $resultado = 'Divisão: ' . $minhaConta->dividir();
    } elseif ($operacao == 5) {
        $resultado = 'Exponenciação: ' . $minhaConta->exponenciar();
    }
}
?>
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
        <?php if (isset($resultado)): ?>
            <p><?php echo $resultado; ?></p>
            <a href="index.php">Fazer outra operação</a>
        <?php else: ?>
            <p>Envie o formulário para calcular.</p>
            <a href="index.php">Ir para a calculadora</a>
        <?php endif; ?>
    </div>
</body>
</html>