%{
#include <iostream>

extern int yylex();
void yyerror(const char*);
%}

%define api.value.type {int}

%token HOUR
%token DATE
%token NAME
%token QSTRING
%token INT
%token FLOAT
%token NEQ LEQ GEQ RO RC C CM S EQ LT GT
%token AND OR BETWEEN PRIMARY CREATE TABLE REFERENCES
%token DELETE INSERT SELECT UPDATE VALUES ORDER INTO
%token WHERE DESC ASC DROP FROM LIKE ANDOP KEY NOT NOT_NULL SET
%token AS BY TRUNCATE QUIT AUTO_INCREMENT FOREIGN
%token INT_TYPE FLOAT_TYPE DATE_TYPE CHAR_TYPE TEXT_TYPE HOUR_TYPE

/*todo richiesta ulteriore V + aliases*/

%nterm create_stmt create_stmt_list create_stmt_var fk_stmt_list
%nterm insert_stmt
%nterm select_stmt
%nterm update_stmt set_stmt_list
%nterm delete_stmt
%nterm truncate_stmt
%nterm drop_stmt
%nterm quit_stmt
%nterm order_expr
%nterm expr_list expr
%nterm name_list value_list value_var
%nterm type


%start sql_stmt

%%

sql_stmt: create_stmt | insert_stmt | select_stmt | update_stmt | delete_stmt | truncate_stmt | drop_stmt | quit_stmt
;

create_stmt: CREATE TABLE NAME RO create_stmt_list PRIMARY KEY RO NAME RC C fk_stmt_list RC CM
;

fk_stmt_list: fk_stmt_list C FOREIGN KEY RO NAME RC REFERENCES NAME RO NAME RC | FOREIGN KEY RO NAME RC REFERENCES NAME RO NAME RC
;

create_stmt_list: create_stmt_list C create_stmt_var | create_stmt_var
;

create_stmt_var: NAME type | NAME type NOT_NULL | NAME type NOT_NULL AUTO_INCREMENT
;

insert_stmt: INSERT INTO NAME RO name_list RC VALUES RO value_list RC CM
;

select_stmt:
  SELECT S FROM name_list CM
| SELECT S FROM name_list order_expr CM
| SELECT S FROM name_list WHERE expr_list CM
| SELECT S FROM name_list WHERE expr_list order_expr CM
| SELECT name_list FROM name_list CM
| SELECT name_list FROM name_list order_expr CM
| SELECT name_list FROM name_list WHERE expr_list CM
| SELECT name_list FROM name_list WHERE expr_list order_expr CM
;

order_expr:
  ORDER BY NAME
| ORDER BY NAME ASC
| ORDER BY NAME DESC
;

delete_stmt: DELETE FROM NAME WHERE expr_list CM
;

update_stmt: UPDATE NAME SET set_stmt_list CM
;

set_stmt_list: set_stmt_list C NAME EQ value_var | NAME EQ value_var
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
| expr BETWEEN expr AND expr
| expr LIKE QSTRING /*todo check*/
| NAME
| value_var
;

truncate_stmt: TRUNCATE TABLE NAME CM
;

drop_stmt: DROP TABLE NAME CM
;

quit_stmt: QUIT CM
;

name_list: name_list C NAME | NAME
;

value_list: value_list C value_var | value_var
;

value_var: QSTRING | HOUR | DATE | INT | FLOAT
;

type: INT_TYPE | FLOAT_TYPE | CHAR_TYPE | TEXT_TYPE | DATE_TYPE | HOUR_TYPE
;


%%

void yyerror(const char* err) {
    std::cout << err << std::endl;
}