#include "createstatement.h"

CreateStatement::CreateStatement() {}

CreateStatement::~CreateStatement() {
    std::cout << "create statement destructed" << std::endl;
}

bool CreateStatement::execute() const {
    std::cout << "create statement executed" << std::endl;
    return true;
}