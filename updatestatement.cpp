#include <exception>

#include "updatestatement.h"


UpdateStatement::UpdateStatement() {}

UpdateStatement::~UpdateStatement() {
    std::cout << "update statement destructed" << std::endl;
}

bool UpdateStatement::execute() const {
    std::cout << "update statement executed" << std::endl;
    return true;
}