%{
#include <stdio.h>
#include <string.h>

int linha = 1;

// Lista de palavras-chave reconhecidas
const char* palavras_reservadas[] = {
    "int", "if", "else", "while", "return", "main", NULL
};

int eh_palavra_reservada(const char* str) {
    int i = 0;
    while (palavras_reservadas[i]) {
        if (strcmp(str, palavras_reservadas[i]) == 0)
            return 1;
        i++;
    }
    return 0;
}
%}

%%
"//".*                          { /* Comentário de linha: ignorado */ }
\/\*([^*]|\*+[^/])*\*\/        { /* Comentário de bloco: ignorado */ }

"=="                            { printf("OP(EQ) na linha %d\n", linha); }
"!="                            { printf("OP(NEQ) na linha %d\n", linha); }
"<="                            { printf("OP(LE) na linha %d\n", linha); }
">="                            { printf("OP(GE) na linha %d\n", linha); }
"<"                             { printf("OP(LT) na linha %d\n", linha); }
">"                             { printf("OP(GT) na linha %d\n", linha); }

"="                             { printf("OP(ASSIGN) na linha %d\n", linha); }
"+"                             { printf("OP(PLUS) na linha %d\n", linha); }
"-"                             { printf("OP(MINUS) na linha %d\n", linha); }
"*"                             { printf("OP(MUL) na linha %d\n", linha); }
"/"                             { printf("OP(DIV) na linha %d\n", linha); }

";"                             { printf("SYM(SEMI) na linha %d\n", linha); }
"{"                             { printf("SYM(LBRACE) na linha %d\n", linha); }
"}"                             { printf("SYM(RBRACE) na linha %d\n", linha); }
"("                             { printf("SYM(LPAREN) na linha %d\n", linha); }
")"                             { printf("SYM(RPAREN) na linha %d\n", linha); }

[0-9]+                          { printf("NUM(%s) na linha %d\n", yytext, linha); }

[a-zA-Z_][a-zA-Z0-9_]*          {
                                  if (eh_palavra_reservada(yytext))
                                      printf("KEYWORD(%s) na linha %d\n", yytext, linha);
                                  else
                                      printf("IDENT(%s) na linha %d\n", yytext, linha);
                               }

[ \t]+                          { /* Ignora espaços e tabs */ }
\n                              { linha++; }

.                               {
                                  fprintf(stderr, "ERRO LÉXICO: símbolo inválido '%s' na linha %d\n", yytext, linha);
                                }

%%

int yywrap() {
    return 1;
}

int main(int argc, char **argv) {
    yylex();
    return 0;
}
