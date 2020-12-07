/* A Bison parser, made by GNU Bison 3.7.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_D_ASANT_WORKSPACE_CLIONPROJECTS_CPP_SQL_ENGINE_PARSER_HPP_INCLUDED
# define YY_YY_D_ASANT_WORKSPACE_CLIONPROJECTS_CPP_SQL_ENGINE_PARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 11 "D:/asant/workspace/CLionProjects/cpp-sql-engine/parser.y"
 
  #include "parser_types.h"

#line 53 "D:/asant/workspace/CLionProjects/cpp-sql-engine/parser.hpp"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    HOUR = 258,                    /* HOUR  */
    DATE = 259,                    /* DATE  */
    NAME = 260,                    /* NAME  */
    QSTRING = 261,                 /* QSTRING  */
    INT = 262,                     /* INT  */
    FLOAT = 263,                   /* FLOAT  */
    NEQ = 264,                     /* NEQ  */
    LEQ = 265,                     /* LEQ  */
    GEQ = 266,                     /* GEQ  */
    RO = 267,                      /* RO  */
    RC = 268,                      /* RC  */
    C = 269,                       /* C  */
    CM = 270,                      /* CM  */
    S = 271,                       /* S  */
    EQ = 272,                      /* EQ  */
    LT = 273,                      /* LT  */
    GT = 274,                      /* GT  */
    AND = 275,                     /* AND  */
    OR = 276,                      /* OR  */
    BETWEEN = 277,                 /* BETWEEN  */
    PRIMARY = 278,                 /* PRIMARY  */
    CREATE = 279,                  /* CREATE  */
    TABLE = 280,                   /* TABLE  */
    REFERENCES = 281,              /* REFERENCES  */
    DELETE = 282,                  /* DELETE  */
    INSERT = 283,                  /* INSERT  */
    SELECT = 284,                  /* SELECT  */
    UPDATE = 285,                  /* UPDATE  */
    VALUES = 286,                  /* VALUES  */
    ORDER = 287,                   /* ORDER  */
    INTO = 288,                    /* INTO  */
    WHERE = 289,                   /* WHERE  */
    DESC = 290,                    /* DESC  */
    ASC = 291,                     /* ASC  */
    DROP = 292,                    /* DROP  */
    FROM = 293,                    /* FROM  */
    LIKE = 294,                    /* LIKE  */
    ANDOP = 295,                   /* ANDOP  */
    KEY = 296,                     /* KEY  */
    NOT = 297,                     /* NOT  */
    NOT_NULL = 298,                /* NOT_NULL  */
    SET = 299,                     /* SET  */
    AS = 300,                      /* AS  */
    BY = 301,                      /* BY  */
    TRUNCATE = 302,                /* TRUNCATE  */
    QUIT = 303,                    /* QUIT  */
    AUTO_INCREMENT = 304,          /* AUTO_INCREMENT  */
    FOREIGN = 305,                 /* FOREIGN  */
    INT_TYPE = 306,                /* INT_TYPE  */
    FLOAT_TYPE = 307,              /* FLOAT_TYPE  */
    DATE_TYPE = 308,               /* DATE_TYPE  */
    CHAR_TYPE = 309,               /* CHAR_TYPE  */
    TEXT_TYPE = 310,               /* TEXT_TYPE  */
    HOUR_TYPE = 311                /* HOUR_TYPE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 18 "D:/asant/workspace/CLionProjects/cpp-sql-engine/parser.y"

  SqlStatement* stmt_t;
  CreateStatement* create_t;
  SelectStatement* select_t;
  DropStatement* drop_t;

#line 133 "D:/asant/workspace/CLionProjects/cpp-sql-engine/parser.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);

#endif /* !YY_YY_D_ASANT_WORKSPACE_CLIONPROJECTS_CPP_SQL_ENGINE_PARSER_HPP_INCLUDED  */
