clean:
	rm lex.yy.c y.tab.c y.tab.h myCalc

build:
	lex myCalc.l
	yacc -d myCalc.y
	gcc lex.yy.c y.tab.c -o myCalc