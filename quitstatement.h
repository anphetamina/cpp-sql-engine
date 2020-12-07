#pragma once

#include "sqlstatement.h"

class QuitStatement : public SqlStatement {
    public:
        QuitStatement();
        ~QuitStatement() override;

        bool execute() const override;
};