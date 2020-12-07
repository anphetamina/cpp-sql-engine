%{
#include <cstdio>
#include <exception>

extern int yylineno;
extern int yylex();
void yyerror(const char*);

%}

%code requires { 
  #include "parser_types.h"
}

%locations
%define parse.error detailed

%union {
  SqlStatement* stmt_t;
  CreateStatement* create_t;
  InsertStatement* insert_t;
  DeleteStatement* delete_t;
  UpdateStatement* update_t;
  SelectStatement* select_t;
  DropStatement* drop_t;
  TruncateStatement* truncate_t;
  QuitStatement* quit_t;
}

%token HOUR
%token DATE
%token NAME
%token QSTRING
%token INT
%token FLOAT
%token NEQ LEQ GEQ RO RC C CM S EQ LT GT D
%token AND OR BETWEEN PRIMARY CREATE TABLE REFERENCES
%token DELETE INSERT SELECT UPDATE VALUES ORDER INTO
%token WHERE DESC ASC DROP FROM LIKE ANDOP KEY NOT NOT_NULL SET
%token AS BY TRUNCATE QUIT AUTO_INCREMENT FOREIGN
%token INT_TYPE FLOAT_TYPE DATE_TYPE CHAR_TYPE TEXT_TYPE HOUR_TYPE

%type<stmt_t> sql_stmt
%type<create_t> create_stmt
%type<insert_t> insert_stmt
%type<select_t> select_stmt
%type<update_t> update_stmt
%type<delete_t> delete_stmt
%type<truncate_t> truncate_stmt
%type<drop_t> drop_stmt
%type<quit_t> quit_stmt
%nterm col_def_list col_def_var
%nterm fk_list
%nterm assign_list
%nterm order_expr
%nterm expr_list expr
%nterm value_list value_var
%nterm col_type col_list col_var
%nterm opt_where opt_order opt_fk opt_as

%left OR
%left ANDOP
%left NOT
%nonassoc LIKE
%left BETWEEN
%left GEQ LEQ NEQ EQ LT GT

%start prog

%%

prog: 
sql_stmt
{
  $1->execute();
  
}
| prog sql_stmt
{
  $2->execute();
}
;

sql_stmt:
create_stmt { $$ = $1; }
| insert_stmt { $$ = $1; }
| select_stmt { $$ = $1; }
| update_stmt { $$ = $1; }
| delete_stmt { $$ = $1; }
| truncate_stmt { $$ = $1; }
| drop_stmt { $$ = $1; }
| quit_stmt { $$ = $1; }
;

create_stmt: CREATE TABLE NAME RO col_def_list C PRIMARY KEY RO NAME RC opt_fk RC CM
{
  $$ = new CreateStatement();
}
;

opt_fk: | C fk_list
;

fk_list:
fk_list C FOREIGN KEY RO NAME RC REFERENCES NAME RO NAME RC 
| FOREIGN KEY RO NAME RC REFERENCES NAME RO NAME RC
;

col_def_list: col_def_list C col_def_var | col_def_var
;

col_def_var: NAME col_type | NAME col_type NOT_NULL | NAME col_type NOT_NULL AUTO_INCREMENT
; /* TODO fix */

insert_stmt: INSERT INTO NAME RO name_list RC VALUES RO value_list RC CM
{
  $$ = new InsertStatement();
}
;

select_stmt:
SELECT S FROM name_list opt_where opt_order CM
{
  $$ = new SelectStatement();
}
| SELECT col_list FROM name_list opt_where opt_order CM
{
  $$ = new SelectStatement();
}
;

col_list:
col_list C col_var opt_as
| col_var opt_as
;

col_var:
NAME D NAME
| NAME
;

opt_as: | AS NAME
;

opt_order: | order_expr
;

opt_where: | WHERE expr_list
;

order_expr:
ORDER BY NAME
| ORDER BY NAME ASC
| ORDER BY NAME DESC
;

delete_stmt: DELETE FROM NAME WHERE expr_list CM
{
  $$ = new DeleteStatement();
}
;

update_stmt: UPDATE NAME SET assign_list WHERE expr_list CM
{
  $$ = new UpdateStatement();
}
;

assign_list: assign_list C NAME EQ value_var | NAME EQ value_var
;

expr_list:
expr_list ANDOP expr
| expr_list OR expr
| expr
;

expr:
expr NEQ expr
| expr LEQ expr
| expr GEQ expr
| expr EQ expr
| expr LT expr
| expr GT expr
| NOT expr
| expr BETWEEN expr AND expr %prec BETWEEN
| expr LIKE QSTRING
| NAME
| value_var
;

truncate_stmt: TRUNCATE TABLE NAME CM
{
  $$ = new TruncateStatement();
}
;

drop_stmt: DROP TABLE NAME CM
{
  $$ = new DropStatement();
}
;

quit_stmt: QUIT CM
{
  $$ = new QuitStatement();
}
;

name_list: name_list C NAME | NAME
;

value_list: value_list C value_var | value_var
;

value_var: QSTRING | HOUR | DATE | INT | FLOAT
;

col_type: INT_TYPE | FLOAT_TYPE | CHAR_TYPE | TEXT_TYPE | DATE_TYPE | HOUR_TYPE
;


%%

void yyerror(const char* err) {
  // printf("SYNTAX ERROR [%d:%d]\n%s\n", yylloc.first_line, yylloc.first_column, err);
  printf("%s\n", err);
}