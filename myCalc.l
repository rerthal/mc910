%{
    #include <stdlib.h>
    #include "calc3.h"
    #include "y.tab.h"
    void yyerror(char *);
%}

%%

[a-z] { 
    yylval.sIndex = *yytext - 'a';
    return VARIABLE;
}

[1-9][0-9]* {
    yylval.iValue = atoi(yytext);
    return INTEGER;
}

";" {
    return SEMIC;
}

"+" {
    return SUM;
}

"*" {
    return TIMES;
}

":=" {
    return ATRIB;
}

"print" {
    return PRINT;
}

"(" {
    return LPAREN;
}

")" {
    return RPAREN;
}

[\s\t\n]+ ;

. yyerror("Unknown character");

%%
int yywrap(void) {
    return 1;
}