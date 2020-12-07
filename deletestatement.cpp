#include <exception>

#include "deletestatement.h"


DeleteStatement::DeleteStatement() {}

DeleteStatement::~DeleteStatement() {
    std::cout << "delete statement destructed" << std::endl;
}

bool DeleteStatement::execute() const {
    std::cout << "delete statement executed" << std::endl;
    return true;
}