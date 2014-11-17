%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}
%option yylineno
%%

[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}

[a-z] {
    yylval = *yytext - 'a';
    yylloc.first_line = yylineno;
    return IDENTIFIER;
}

[+*;()] { return *yytext; }

print return PRINT;
:=    return ASSIGN;

[ \t\n] ;

. { 
    printf("programa invalido!\n");
    exit(0);
}
%%