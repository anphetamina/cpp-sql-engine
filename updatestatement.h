#pragma once

#include "sqlstatement.h"

class UpdateStatement : public SqlStatement {
    public:
        UpdateStatement();
        ~UpdateStatement() override;

        bool execute() const override;
};