#include <exception>

#include "quitstatement.h"


QuitStatement::QuitStatement() {}

QuitStatement::~QuitStatement() {
    std::cout << "QUIT statement destructed" << std::endl;
}

bool QuitStatement::execute() const {
    std::cout << "quit statement executed" << std::endl;
    exit(EXIT_SUCCESS);
}