<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->exclude(['node_modules', '.github', 'vendor'])
    ->notPath('.php-cs-fixer.dist.php');

return (new PhpCsFixer\Config())
    ->setRules([
        '@PSR12' => true,
        'array_syntax' => ['syntax' => 'short'],
        'braces' => ['allow_single_line_closure' => true],
        'no_unused_imports' => true,
        'ordered_imports' => ['sort_algorithm' => 'alpha'],
        'no_trailing_whitespace' => true,
        'no_whitespace_in_blank_line' => true,
        'single_quote' => true,
    ])
    ->setFinder($finder);
