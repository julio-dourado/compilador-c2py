# Sprint 2: Analisador Léxico e Parser Inicial

Período: 23/04/2025 - 30/04/2025

## Objetivos

Esta sprint teve como foco a implementação do analisador léxico e o início do desenvolvimento do parser, culminando com a apresentação do primeiro ponto de controle (P1) do projeto.

## Entregáveis Planejados

- Analisador léxico funcional (arquivo `.l` completo)
- Primeiras regras sintáticas no Bison (`.y`)

## Tarefas Realizadas

### 1. Implementação do Analisador Léxico

- [x] Desenvolvimento do arquivo `lexer.l` para reconhecimento dos tokens
- [x] Implementação de reconhecimento de palavras‑chave (`int`, `main`, `if`, `return`)
- [x] Suporte a identificadores, números e operadores básicos
- [x] Tratamento de comentários de linha e bloco
- [x] Contagem de linhas para mensagens de erro mais precisas
- [x] Criação de uma versão de debug (`lexer_debug.l`) para testes isolados

### 2. Desenvolvimento Inicial do Parser

- [x] Criação do arquivo `parser.y` com a definição inicial da gramática
- [x] Implementação das regras para reconhecimento da função main
- [x] Suporte a declarações de variáveis com e sem inicialização
- [x] Implementação da estrutura básica de controle if
- [x] Suporte a expressões simples (identificador, número, operações básicas)
- [x] Integração do lexer com o parser

### 3. Integração e Testes

- [x] Definição de alvos separados para teste do lexer e do parser completo
- [x] Criação de casos de teste simples para validar o funcionamento
- [x] Implementação de mensagens de saída para debug

### 4. Ponto de Controle P1

- [x] Preenchimento do formulário para a apresentação P1
- [x] Preparação da apresentação de 5 minutos
- [x] Demonstração do funcionamento do lexer e parser inicial

## Resultados Alcançados

1. Analisador Léxico Completo: Implementação funcional capaz de reconhecer todos os tokens planejados para esta fase.
2. Parser Básico: Desenvolvimento de um parser que reconhece estruturas simples como função main, declarações e estrutura if.
3. Sistema Integrado: Integração entre o analisador léxico e o parser, permitindo análise completa de programas C simples.
4. Apresentação P1: Concluímos com sucesso a apresentação do primeiro ponto de controle do projeto.

## Implementações Técnicas

### Analisador Léxico (`lexer.l`)

```c
// Comentário de linha: ignorado
"//".*                         { /* ignora */ }

/* Comentário de bloco: ignorado */
\/\*([^*]|\*+[^/])*\*\/        { /* ignora */ }

"="                            { return OP_ASSIGN; }
"+"                            { return OP_PLUS; }
">"                            { return OP_GT; }

"("                            { return LPAREN; }
")"                            { return RPAREN; }
"{"                            { return LBRACE; }
"}"                            { return RBRACE; }
";"                            { return SEMI; }

[0-9]+                         { return NUM; }

[a-zA-Z_][a-zA-Z0-9_]*         {
    /* Verifica se o lexema corresponde a uma palavra‑chave */
    if (strcmp(yytext, "int") == 0)
        return INT;
    else if (strcmp(yytext, "main") == 0)
        return MAIN;
    else if (strcmp(yytext, "if") == 0)
        return IF;
    else if (strcmp(yytext, "return") == 0)
        return RETURN;
    else
        return IDENT;
}
```

### Parser Inicial (`parser.y`)

```c
%start program

%%

/* Símbolo inicial */
program:
    function_decl
    ;

/* Regra para declaração da função main */
function_decl:
    INT MAIN LPAREN RPAREN compound_stmt {
        printf("Função main definida corretamente.\n");
    }
    ;

/* Bloco composto (corpo da função) */
compound_stmt:
      LBRACE stmt_list RBRACE
    ;

/* Lista de declarações/instruções */
stmt_list:
      /* vazio */
    | stmt_list stmt
    ;

/* Diferentes tipos de instruções */
stmt:
      declaration_stmt        /* Declaração com ou sem inicialização */
    | if_stmt                 { printf("Estrutura if reconhecida.\n"); }
    | return_stmt             { printf("Retorno reconhecido.\n"); }
    ;

%%
```

## Testes Realizados

Utilizamos o seguinte código de teste (`input.c`) para validar o compilador:

```c
int main() {
    int x = 10;
    int y = x + 2;
    // isso é um comentário
    if (y > 5) {
        return y;
    }
}
```

A saída do parser para este código é:

```
Iniciando o parsing...
Função main definida corretamente.
Declaração com atribuição reconhecida.
Declaração com atribuição reconhecida.
Estrutura if reconhecida.
Retorno reconhecido.
Parsing concluído com sucesso!
```

## Dificuldades Encontradas

1. Integração Flex/Bison: Sincronizar corretamente a comunicação entre o lexer e o parser.
2. Gramática Ambígua: Resolver conflitos iniciais nas regras gramaticais.
3. Tratamento de Erros: Implementar mensagens de erro informativas para o usuário.

## Lições Aprendidas

1. A importância de testar incrementalmente cada componente.
2. O valor de definir uma gramática não‑ambígua desde o início.
3. A necessidade de mensagens de erro claras para facilitar o debugging.
