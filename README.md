# ETEC Hortolândia — Informática para Internet (Módulo II)

[![Lint](https://github.com/ayuwooh/ETEC-II-2S-2026/actions/workflows/lint.yml/badge.svg)](https://github.com/ayuwooh/ETEC-II-2S-2026/actions/workflows/lint.yml)

Trabalhos e atividades do **Módulo II** do curso Técnico em Informática para Internet — ETEC de Hortolândia (2º semestre de 2026).

## Matérias

| Código | Disciplina |
|--------|-----------|
| [SSI](ssi-seguranca-de-sistemas-da-informacao) | Segurança de Sistemas da Informação |
| [ECO](eco-etica-e-cidadania-organizacional) | Ética e Cidadania Organizacional |
| [CNI](cni-computacao-em-nuvem-i) | Computação em Nuvem I |
| [DMI](dmi-desenvolvimento-para-dispositivos-moveis-i) | Desenvolvimento para Dispositivos Móveis I |
| [IW2](iw2-interfaces-web-ii) | Interfaces Web II |
| [SW1](sw1-sistemas-web-i) | Sistemas Web I |
| [PTCC](ptcc-planejamento-do-tcc) | Planejamento do Trabalho de Conclusão de Curso |

## Estrutura

Cada disciplina segue o mesmo esqueleto — `atividades/`, `materiais/`, `provas/` e `README.md`. Convenções de nomenclatura e lint em [AGENTS.md](AGENTS.md).

```text
<disc>/
├── atividades/    # exercícios e práticas
├── materiais/     # slides, apostilas e materiais de aula
├── provas/        # avaliações
└── README.md
```

`ptcc-planejamento-do-tcc/` também contém `TCC/`. Pastas sem conteúdo mantêm um `.gitkeep` para preservar a estrutura no git.

## Como rodar

- **PHP (SW1)** — copie a atividade para o `htdocs` do XAMPP e acesse via `localhost`.
- **HTML/JS (IW2)** — abra o `index.html` da atividade no navegador.
- **Dart (DMI)** — `dart run <arquivo>.dart` dentro de `atividades/04-beecrowd/` ou `atividades/03-pratica-dart/`.

## Certificação

Após conclusão dos **Módulos I + II**: **Desenvolvedor de Aplicações Web e Mobile**.

## Ferramentas

- JavaScript (ESLint) · PHP (PHP-CS-Fixer)
- HTML (HTMLHint) · Markdown (markdownlint)
- VS Codium · OnlyOffice
- [opencode](https://opencode.ai) — organização e manutenção do repositório e auxílio nos estudos
- Arch Linux
