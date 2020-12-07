#include "dropstatement.h"

DropStatement::DropStatement() {}

DropStatement::~DropStatement() {
    std::cout << "drop statement destructed" << std::endl;
}

bool DropStatement::execute() const {
    std::cout << "drop statement executed" << std::endl;
    return true;
}