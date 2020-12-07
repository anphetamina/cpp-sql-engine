#pragma once

#include "sqlstatement.h"

class InsertStatement : public SqlStatement {
    public:
        InsertStatement();
        ~InsertStatement() override;

        bool execute() const override;
};