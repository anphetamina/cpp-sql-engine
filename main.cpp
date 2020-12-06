#include <cstdio>
#include <exception>
#include "parser.hpp"

extern FILE *yyin;

int main(int argc, char **argv) {

    yyin = fopen("../inputfile.txt", "r");
    if (!yyin) {
        return -1;
    } else {
        return yyparse();
    }
}