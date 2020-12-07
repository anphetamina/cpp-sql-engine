#include <exception>

#include "truncatestatement.h"


TruncateStatement::TruncateStatement() {}

TruncateStatement::~TruncateStatement() {
    std::cout << "truncate statement destructed" << std::endl;
}

bool TruncateStatement::execute() const {
    std::cout << "truncate statement executed" << std::endl;
    return true;
}