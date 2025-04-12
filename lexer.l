%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"  /* Inclui as definições dos tokens gerados pelo Bison */
int linha = 1;
%}

%%

"//".*                         { /* Comentário de linha: ignorado */ }
\/\*([^*]|\*+[^/])*\*\/       { /* Comentário de bloco: ignorado */ }

"="                            { return OP_ASSIGN; }
"+"                            { return OP_PLUS; }
">"                            { return OP_GT; }

"("                            { return LPAREN; }
")"                            { return RPAREN; }
"{"                            { return LBRACE; }
"}"                            { return RBRACE; }
";"                            { return SEMI; }

[0-9]+                        { return NUM; }

[a-zA-Z_][a-zA-Z0-9_]*         {
    /* Verifica se o lexema corresponde a uma palavra-chave */
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

[ \t]+                        { /* Ignora espaços e tabs */ }
\n                            { linha++; }
.                             { 
                                  fprintf(stderr, "ERRO LÉXICO: símbolo inválido '%s' na linha %d\n", yytext, linha);
                               }

%%

int yywrap(void) {
    return 1;
}
