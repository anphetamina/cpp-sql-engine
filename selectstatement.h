#pragma once

#include "sqlstatement.h"

class SelectStatement : public SqlStatement {
    public:
        SelectStatement();
        ~SelectStatement() override;

        bool execute() const override;
};