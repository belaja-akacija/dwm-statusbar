#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "prepend.h"

int main(void)
{
  char *s = malloc(100);
  /*char t = s;*/
  char *tp = malloc(100);
  char m[1];
  char input[100] = "Test       ";

  /*scanf("%s", input);*/
  strcpy(s, input);
  strcpy(tp, s);
  int len = strlen(s);

  while (1){
    /*printf("%d", len);*/
    for (int i = 0; i < len; ++i) {
      m[0] = s[len-1];
      prepend(tp, " ");
      tp[0] = m[0];
      for (int j = 0; j < len; ++j){
        s[j] = tp[j];
      }
      printf("%s\n", s);
      usleep(200000);
      system("clear");
      strcpy(tp, s);
    }

  }
  /*char t[10];*/
  /*char* s = t;*/
  /*scanf("%s", t);*/
  /*printf("\nOutput: %s\n", s);*/

  /*while (*s != '\0') {*/
  /*printf("%c :: %p\n", *s, s);*/
  /*s++;*/
  /*}*/
}
