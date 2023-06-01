%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex(void);
void yyerror(const char* s);
extern FILE* yyin;

%}

%union {
    char* str;
    int val;
}

%token <val> NUMBER
%token <str> WORD
%token <str> FILENAME
%token MORE
%token LESS
%token AND

%type <str> statement conditions condition

%%

program : statement '\n' { return 0; }
        | program '\n'
        | statement { return 0; }
        ;

statement : WORD WORD WORD WORD WORD FILENAME WORD conditions
            {
                printf("import pandas as pd\n");
                printf("df = pd.read_csv('%s')\n", $6);
                printf("df = df[%s]\n", $8);
            }
            ;

conditions : condition AND conditions
           {
               char* conditions_str = malloc(strlen($1) + strlen($3) + 7);
               sprintf(conditions_str, "%s & %s", $1, $3);
               $$ = conditions_str;
           }
           | condition
           ;

condition : MORE WORD NUMBER WORD
          {
              char* condition_str = malloc(strlen($4) + strlen($4) + 30);
              sprintf(condition_str, "(df['%s'] > %d)", $4, $3);
              $$ = condition_str;
          }
          | LESS WORD NUMBER WORD
          {
              char* condition_str = malloc(strlen($4) + strlen($4) + 30);
              sprintf(condition_str, "(df['%s'] < %d)", $4, $3);
              $$ = condition_str;
          }
          ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char** argv) {
     if(argc==2)
     {
         yyin = fopen(argv[1], "r");
         if(!yyin)
         {
             fprintf(stderr, "can't read file %s\n", argv[1]);
             return 1;
         }
     }
     yyparse();
}