/* RCS information: $Id: myshell.c,v 1.2 2006/04/05 22:46:33 elm Exp $ */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <errno.h>

extern char **getline(void);

int main(void) {
  int i;
  char **args; 

  while(1) {
    printf("$ ");
    args = getline();
    for(i = 0; args[i] != NULL; i++) {
      printf("Argument %d: %s\n", i, args[i]);
    }
  }
}
