%{
/* RCS information: $Id: shell.l,v 1.1 2006/04/05 22:46:33 elm Exp $ */

#include <stdio.h>
#include <strings.h>
#include <string.h>

int _numargs = 200;
char *_args[200];
int _argcount = 0;
char *strdup(const char *);
int fileno(FILE *);
%}

WORD [a-zA-Z0-9\/\.-]+
SPECIAL [()><|&;]

%%
  _argcount = 0; _args[0] = NULL;

{WORD}|{SPECIAL} {
  if(_argcount < _numargs-1) {
    _args[_argcount++] = (char *)strdup(yytext);
    _args[_argcount] = NULL;
  }
}

\n return (int)_args;

[ \t]+

.

%%

char **getline(void) { return (char **)yylex(); }
