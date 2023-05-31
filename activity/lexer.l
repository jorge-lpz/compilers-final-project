%{
#include "compiler.tab.h"
%}

%%


Search            return PRINT;
[0‑9]+              yylval=atoi(yytext); return NUMBER;
[^ \t\n]+           return WORD;
[0‑9]+\.csv       return  FILE;

%%

int yywrap() {
    return 1;
}
