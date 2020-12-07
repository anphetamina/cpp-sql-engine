#include <exception>

#include "insertstatement.h"


InsertStatement::InsertStatement() {}

InsertStatement::~InsertStatement() {
    std::cout << "insert statement destructed" << std::endl;
}

bool InsertStatement::execute() const {
    std::cout << "insert statement executed" << std::endl;
    return true;
}