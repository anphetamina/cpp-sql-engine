#pragma once

#include "sqlstatement.h"

class TruncateStatement : public SqlStatement {
    public:
        TruncateStatement();
        ~TruncateStatement() override;

        bool execute() const override;
};