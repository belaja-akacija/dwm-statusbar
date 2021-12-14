#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*void prepend(char *s, const char *t);*/

/*int main()*/
/*{*/
  /*char *s = malloc(100);*/
  /*strcpy(s, "test");*/
  /*printf("%s\n", s);*/

  /*prepend(s, " ");*/
  /*printf("%s\n", s);*/

  /*return 0;*/
/*}*/

void prepend(char *s, const char *t)
{
  size_t len = strlen(t);
  memmove(s + len, s, strlen(s) + 1);
  memcpy(s, t, len);
}
