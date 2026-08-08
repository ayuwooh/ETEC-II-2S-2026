# Convenções do repositório

## Estrutura

Cada disciplina (`*-nome-da-disciplina/`) segue o mesmo esqueleto:

```
<disc>/
├── atividades/    # exercícios e práticas
├── materiais/     # slides, apostilas e materiais de aula
├── provas/        # avaliações
└── README.md
```

`ptcc-planejamento-do-tcc/` também contém `TCC/`. Pastas sem conteúdo mantêm
um `.gitkeep` para preservar a estrutura no git.

## Nomenclatura

- **Arquivos**: `snake_case`, minúsculas, ASCII (sem acentos), prefixo numérico
  com zero à esquerda quando houver ordenação (`01_`, `02_`, ...).
- **Pastas**: kebab-case, minúsculas, ASCII, prefixo numérico com zero à
  esquerda quando houver ordenação (`01-`, `02-`, ...).

Exemplo:

```
atividades/
├── 01-poo/
│   ├── 01_orientacao_a_objetos.pdf
│   └── 02_poo_aprofundamento.pdf
└── 02-aprofundamento-dart/
    └── aprofundamento_dart.pdf
```

## Documentos do Office

`.docx`, `.pptx`, `.ppsx` e `.xlsx` são ignorados pelo git. Sempre que houver a
versão editável e o PDF, mantenha apenas o PDF versionado.

## Lint

- JavaScript: `npx eslint '**/*.js'` (config: `eslint.config.mjs`)
- PHP: `php-cs-fixer fix --dry-run --diff` (config: `.php-cs-fixer.dist.php`)
- Markdown: `npx markdownlint-cli@latest '**/*.md' --ignore node_modules --config .markdownlint.json`
- HTML: `npx htmlhint@latest '**/*.html'`
- Dart: `dart analyze` e `dart format --output=none --set-exit-if-changed` na pasta `dmi-desenvolvimento-para-dispositivos-moveis-i/atividades/03-pratica-dart/`
