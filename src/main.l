
%{
#include <stdlib.h>
#include "y.tab.h"


%}

%%


([0-9]*)(\.[0-9]+)?	{ yylval = atof(yytext); return NUMERO; }
["]([A-Z a-z0-9])*["]	{ yylval = strdup(yytext); return STRING; }
[\x00-\x20]+	/* nao faz nada */
.	{ return yytext[0]; }


%%

int yywrap() {
  return 1;
}
