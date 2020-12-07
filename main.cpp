#include <cstdio>
#include "parser.hpp"

extern FILE *yyin;

int main(int argc, char **argv) {

    yyin = fopen("../input.txt", "r");
    if (!yyin) {
        return -1;
    }
    
    return yyparse();


    /* while (yyparse() < 2);
    
    return 0; */
}