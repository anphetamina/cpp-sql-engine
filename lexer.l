%{
#include "parser.hpp"

#define TOKEN(name) { printf("%s: %s\n", #name, yytext); return name; }

#define YY_USER_ACTION                                               \
    yylloc.first_line = yylloc.last_line;                          \
    yylloc.first_column = yylloc.last_column;                      \
    if (yylloc.last_line == yylineno)                               \
      yylloc.last_column += yyleng;                                 \
    else {                                                           \
      yylloc.last_line = yylineno;                                  \
      yylloc.last_column = yytext + yyleng - strrchr(yytext, '\n'); \
    }
%}


%option noyywrap case-insensitive yylineno

ws                      [ \t]+
nl                      [\n]+
qstring                 \"[^\"]+\"
name                    [A-Za-z][A-Za-z0-9_]*
date                    (0[0-9]|(1|2)[0-9]|3(0|1))\/(0[0-9]|1[0-2])\/(1[0-9]{3}|2[0-9]{3})
hour                    ((0|1)[0-9]|2[0-3])(\.([0-5][0-9])){2}
int                     [1-9][0-9]*
float                   {int}\.[0-9]+

%s BTW

%%



{ws}|{nl}               /*ignored*/;

<BTW>AND                {BEGIN(0); TOKEN(AND);};
BETWEEN		            {BEGIN(BTW); TOKEN(BETWEEN);};
PRIMARY		            TOKEN(PRIMARY);
CREATE		            TOKEN(CREATE);
TABLE		            TOKEN(TABLE);
DELETE		            TOKEN(DELETE);
INSERT		            TOKEN(INSERT);
SELECT		            TOKEN(SELECT);
UPDATE		            TOKEN(UPDATE);
VALUES		            TOKEN(VALUES);
ORDER		            TOKEN(ORDER);
WHERE		            TOKEN(WHERE);
DESC		            TOKEN(DESC);
ASC		                TOKEN(ASC);
DROP		            TOKEN(DROP);
FROM		            TOKEN(FROM);
LIKE		            TOKEN(LIKE);
AND			            TOKEN(ANDOP);
KEY			            TOKEN(KEY);
NOT			            TOKEN(NOT);
"NOT NULL"              TOKEN(NOT_NULL);
SET			            TOKEN(SET);
AS			            TOKEN(AS);
BY			            TOKEN(BY);
OR			            TOKEN(OR);
TRUNCATE		        TOKEN(TRUNCATE);
QUIT		            TOKEN(QUIT);
AUTO_INCREMENT          TOKEN(AUTO_INCREMENT);
FOREIGN                 TOKEN(FOREIGN);
REFERENCES              TOKEN(REFERENCES);
INTO                    TOKEN(INTO);


"<>" 		            TOKEN(NEQ);
"<="		            TOKEN(LEQ);
">="		            TOKEN(GEQ);

"("		                TOKEN(RO);
")"		                TOKEN(RC);
","		                TOKEN(C);
";"		                TOKEN(CM);
"*"		                TOKEN(S);
"="                     TOKEN(EQ);
"<"                     TOKEN(LT);
">"                     TOKEN(GT);

INT                     TOKEN(INT_TYPE);
FLOAT                   TOKEN(FLOAT_TYPE);
DATE                    TOKEN(DATE_TYPE);
CHAR                    TOKEN(CHAR_TYPE);
TEXT                    TOKEN(TEXT_TYPE);
TIME                    TOKEN(HOUR_TYPE);

{hour}|\"{hour}\"       TOKEN(HOUR);
{date}|\"{date}\"       TOKEN(DATE);
{name}                  TOKEN(NAME);
{qstring}               TOKEN(QSTRING);

{int}                   TOKEN(INT);
{float}                 TOKEN(FLOAT);

.                       {printf("ERR: %s", yytext);};

%%