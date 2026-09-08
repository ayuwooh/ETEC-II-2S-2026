# Convenções do repositório

## Estrutura

Cada disciplina (`*-nome-da-disciplina/`) segue o mesmo esqueleto:

```text
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

```text
atividades/
├── 01-poo/
│   ├── 01_orientacao_a_objetos.pdf
│   └── 02_poo_aprofundamento.pdf
└── 02-aprofundamento-dart/
    └── 02_aprofundamento_dart.pdf
```

## Documentos do Office

`.docx`, `.pptx`, `.ppsx` e `.xlsx` são ignorados pelo git e não devem ser versionados.
Sempre que houver a versão editável e o PDF, mantenha apenas o PDF versionado.

Para desvincular um arquivo que já foi versionado sem removê-lo do disco:

```text
git rm --cached <arquivo.docx>
```

## Lint

Instale as dependências uma vez: `npm install`.

- Tudo (JS + Markdown + HTML): `npm run lint`
- JavaScript: `npm run lint:js`
- Markdown: `npm run lint:md`
- HTML: `npm run lint:html`
- PHP: `php-cs-fixer fix --dry-run --diff` (config: `.php-cs-fixer.dist.php`)
- Dart: `dart analyze` e `dart format --output=none --set-exit-if-changed`
  nas pastas de atividades de DMI (`03-pratica-dart/` e `04-beecrowd/`)

> **Atividades:** o código dentro de `atividades/` deve passar nos lints acima.
> Se algum lint falhar, corrija o código (ou o config), não o ignore.
