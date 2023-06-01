%{
#include "y.tab.h"
%}

%%

"more"                          { return MORE; }
"less"                          { return LESS; }
"and"                           { return AND; }
[0-9]+                          { yylval.val = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z_0-9_-]*\.csv    { yylval.str = strdup(yytext); return FILENAME; }
[a-zA-Z]+                       { yylval.str = strdup(yytext); return WORD; }
\n                              { return '\n'; }
[ \t]+   ;

%%

int yywrap() {
    return 1;
}