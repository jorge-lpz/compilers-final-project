%{
#include "y.tab.h"
%}

%%


Search                          { return PRINT; }
more                            { return MORE; }
less                            { return LESS; }
and                             { return AND; }
[0-9]+                          { yylval.val = atoi(yytext); return NUMBER; }
[^ \t\n]+                       { return WORD; }
[a-zA-Z][a-zA-Z_0-9_-]*\.csv    { yylval.str = strdup(yytext); return FILENAME; }
\n                              { return 0; }

%%

int yywrap() {
    return 1;
}
