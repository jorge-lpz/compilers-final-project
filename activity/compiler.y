%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printImport(char* filename);

%}

%%



%%

void printImport(char* filename) {
    printf("import pandas as pd;\n");
    printf("df = pd.read_csv('%s')\n", filename);
}