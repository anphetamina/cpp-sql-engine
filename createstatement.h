#pragma once

#include "sqlstatement.h"

class CreateStatement : public SqlStatement {
    public:
        CreateStatement();
        ~CreateStatement() override;

        bool execute() const override;
};