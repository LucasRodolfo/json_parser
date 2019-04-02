
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *c);
int yylex(void);
int flag=1;
%}

%token STRING
%token NUMERO

%%
json
  : value {printf("VALIDO\n");}

value
	: object
	| string
	| array
	| number

object
	: '{' members '}'
	| '{' '}'

members
	: member
	| member ',' members

member
	: key ':' element

key
	: string

string
	: STRING

array
	: '[' elements ']'
	| '[' ']'

elements
	: element
	| element ',' elements

element
  :  value

number
	: NUMERO

%%

void yyerror(const char *s) {
    printf("INVALIDO\n");
    flag = 0;
}

int main() {
  yyparse();

    return 0;
}
