<?php

class Aluno
{
    private $nome;
    private $nota1;
    private $nota2;
    private $nota3;
    private $faltas;
    private $media;

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function setFaltas($faltas)
    {
        $this->faltas = $faltas;
    }

    public function calcularMedia($nota1, $nota2, $nota3)
    {
        $this->nota1 = $nota1;
        $this->nota2 = $nota2;
        $this->nota3 = $nota3;
        $this->media = ($nota1 + $nota2 + $nota3) / 3;
        return $this->media;
    }

    public function getMedia()
    {
        return $this->media;
    }

    public function calcularPresenca()
    {
        $presenca = ((80 - $this->faltas) / 80) * 100;
        return $presenca;
    }

    public function mostrarResultado()
    {
        $presenca = $this->calcularPresenca();

        if ($presenca < 75) {
            return 'Reprovado por falta';
        }

        if ($this->media < 5) {
            return 'Reprovado';
        } elseif ($this->media >= 5 && $this->media <= 7) {
            return 'Recuperação';
        } else {
            return 'Aprovado';
        }
    }
}
