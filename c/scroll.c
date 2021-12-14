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
  char input[100];

  printf("Enter string to scroll: ");
  // takes only one word at a time. How do I make it take the entire string from input?
  scanf("%s", input);
  system("clear");
  strcpy(s, input);
  prepend(s, "     ");
  strcpy(tp, s);
  int len = strlen(s);

  while (1){
    /*printf("%d", len);*/
    for (int i = 0; i < len; ++i) {
      m[0] = s[len-1];
      // to reverse direction, uncomment
      /*prepend(tp, " ");*/
      /*tp[0] = m[0];*/
      for (int j = 0; j < len; ++j){
        /*s[j] = tp[j];*/
        s[j] = tp[j+1];
      }
      // comment out, to reverse direction
      s[len-1] = tp[0];
      printf("%s\n", s);
      usleep(200000);
      system("clear");
      strcpy(tp, s);
    }

  }
}
