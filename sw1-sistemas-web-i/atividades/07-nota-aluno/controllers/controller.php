<?php

require_once __DIR__ . '/../models/aluno.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'] ?? '';
    $nota1 = $_POST['nota1'] ?? 0;
    $nota2 = $_POST['nota2'] ?? 0;
    $nota3 = $_POST['nota3'] ?? 0;
    $faltas = $_POST['faltas'] ?? 0;

    $aluno = new Aluno();
    $aluno->setNome($nome);
    $aluno->setFaltas($faltas);
    $aluno->calcularMedia($nota1, $nota2, $nota3);
    $presenca = $aluno->calcularPresenca();
    $resultado = $aluno->mostrarResultado();
}
