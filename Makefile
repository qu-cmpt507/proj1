all:
	flex shell.l
	cc myshell.c lex.yy.c -L/usr/lib -lfl -o myshell

clean:
	rm -f lex.yy.c myshell
