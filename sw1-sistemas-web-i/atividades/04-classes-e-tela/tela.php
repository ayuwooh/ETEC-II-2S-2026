<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora</title>
</head>
<body>
    <form action="index.php" method="post">
        <label for="valor1">Primeiro Valor</label>
        <input type="number" name="valor1" id="valor1">
        <label for=""></label>
        <select name="operacao" id="operacao">
            <option value="0">Selecione uma Operação</option>
            <option value="1">Soma</option>
            <option value="2">Subtração</option>
            <option value="3">Multiplicação</option>
            <option value="4">Divisão</option>
            <option value="5">Exponenciação</option>
        </select>
        <label for="valor2">Segundo Valor</label>
        <input type="number" name="valor2" id="valor2">
        <button type="submit" name="btnCalcular" id="btnCalcular">Calcular</button>
    </form>
</body>
</html>