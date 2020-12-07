#pragma once

#include "sqlstatement.h"

class DropStatement : public SqlStatement {
    public:
        DropStatement();
        ~DropStatement() override;

        bool execute() const override;
};