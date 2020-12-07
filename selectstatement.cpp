#include <exception>

#include "selectstatement.h"


SelectStatement::SelectStatement() {}

SelectStatement::~SelectStatement() {
    std::cout << "select statement destructed" << std::endl;
}

bool SelectStatement::execute() const {
    std::cout << "select statement executed" << std::endl;
    return true;
}