#pragma once

#include "sqlstatement.h"

class DeleteStatement : public SqlStatement {
    public:
        DeleteStatement();
        ~DeleteStatement() override;

        bool execute() const override;
};