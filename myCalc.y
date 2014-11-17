%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    int variables[26];
    void yyerror(const char *str);
    int get_var(char i, int line);
%}
%token NUMBER IDENTIFIER PRINT ASSIGN
%left '+'
%left '*'
%locations
%%
commands:
    | command ';' commands
    ;
command:
    | IDENTIFIER ASSIGN expression { variables[$1] = $3; }
    | PRINT '(' IDENTIFIER ')' { printf("%d\n", get_var($3, @3.first_line)); }
    ;
expression:
    | NUMBER
    | IDENTIFIER                    { $$ = get_var($1, @1.first_line); }
    | expression '+' expression     { $$ = $1 + $3; }
    | expression '*' expression     { $$ = $1 * $3; }
    | '(' expression ')'            { $$ = $2; } 
    ;
%%

void yyerror(const char *str) {
    printf("programa invalido!\n");
    exit(0);
}

int get_var(char i, int line) {
    if (variables[i] == -1) {
        printf("linha %d: variavel %c nao inicializada!\n", line, (int) (i + 'a'));
        exit(0);
    }
    return variables[i];
}

int yywrap() {
    return 1;
} 

main() {
    int i;
    for (i = 0; i < 26; i++) variables[i] = -1;
    yyparse();
}
