#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(void){
  unsigned int intervalle=1;
  while(1){
    printf("je suis un imbecile\n");
    sleep(intervalle);
  }
  return 0;
}