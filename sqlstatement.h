#pragma once

#include <iostream>

class SqlStatement {
    public:
        virtual ~SqlStatement() = default;

        virtual bool execute() const = 0;
};