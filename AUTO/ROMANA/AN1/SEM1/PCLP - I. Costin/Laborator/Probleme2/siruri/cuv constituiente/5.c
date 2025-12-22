//functia pentru citirea unui sir de caractere si afisarea cuvintelor constituente folosind functia strtok
#include <stdio.h>
#include <stdlib.h>

int main ()
{
  char *v,*w;
  v=(char *)calloc(50,sizeof(char));
  printf("introduceti sirul: ");
  gets(v);
  w=strtok(v,",./;'[]<>?:{}|+_-=()*&^%$#@!");
  printf("\n\ncuvintele constituente sirului citit sunt:\n");
  while (w != NULL)
  {
    puts(w);
    w = strtok (NULL, ",./;'[]<>?:{}|+_-=()*&^%$#@!");
  }
  return 0;
}
