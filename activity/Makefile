all:
	lex lexer.l
	yacc compiler.y
	gcc y.tab.c lex.yy.c -ly -ll -o compiler

clean:
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf lex.yy.c