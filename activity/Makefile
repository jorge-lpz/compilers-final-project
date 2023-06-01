all:
	lex lexer.l
	yacc -dy parser.y
	gcc lex.yy.c y.tab.c -ly -ll -o parser.out

clean:
	rm -rf y.tab.c
	rm -rf y.tab.h
	rm -rf lex.yy.c
	rm -rf parser.out