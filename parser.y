%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
void yyerror(const char *s);
%}

/* Definindo os tokens que o lexer deverá retornar.
   Esses tokens devem corresponder aos que serão retornados pelo seu lexer (modificado)
*/
%token INT MAIN IF RETURN IDENT NUM
%token OP_ASSIGN OP_PLUS OP_GT
%token LPAREN RPAREN LBRACE RBRACE SEMI

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
    LPAREN stmt_list RPAREN
    | LBRACE stmt_list RBRACE
    ;

/* Lista de declarações/instruções */
stmt_list:
    /* vazio */
    | stmt_list stmt
    ;

/* Diferentes tipos de instruções */
stmt:
      declaration_stmt  { /* Declaração com ou sem inicialização */ }
    | if_stmt           { printf("Estrutura if reconhecida.\n"); }
    | return_stmt       { printf("Retorno reconhecido.\n"); }
    ;

/* Declaração: Exemplo: int x = 10; ou int x; */
declaration_stmt:
    INT IDENT OP_ASSIGN expression SEMI { printf("Declaração com atribuição reconhecida.\n"); }
    | INT IDENT SEMI { printf("Declaração sem atribuição reconhecida.\n"); }
    ;

/* Instrução if: Exemplo: if (expr) { ... } */
if_stmt:
    IF LPAREN expression RPAREN compound_stmt
    ;

/* Instrução return: Exemplo: return y; */
return_stmt:
    RETURN IDENT SEMI
    ;

/* Expressão simplificada:
   Para efeito do exemplo, consideramos expressões aritméticas simples ou expressões relacionais */
expression:
      IDENT OP_PLUS expression { printf("Expressão de adição.\n"); }
    | IDENT                   { printf("Expressão de identificador.\n"); }
    | NUM                     { printf("Expressão numérica.\n"); }
    | IDENT OP_GT NUM         { printf("Expressão relacional.\n"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}

int main(void) {
    printf("Iniciando o parsing...\n");
    if (yyparse() == 0)
        printf("Parsing concluído com sucesso!\n");
    return 0;
}
