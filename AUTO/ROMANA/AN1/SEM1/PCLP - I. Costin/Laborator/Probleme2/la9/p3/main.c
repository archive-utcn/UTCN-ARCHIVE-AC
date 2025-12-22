#include <stdio.h>
/*copierea unui fişier sursă într-un fişier destinaţie (numele fişierelor se introduce de la tastatură)
 astfel încât fiecare cuvânt să apară pe linie nouă*/
#include <stdlib.h>

int main()
{
  FILE *f,*g;
  f=fopen("Fisier.txt","r");
  g=fopen("Fisier.out.txt","w");
  char c;
  if(f==NULL)
  {
       perror("Eroare");
        exit(1);
  }
    c=fgetc(f);
    while(c!=EOF)
    {
        if(c==' ')
            fprintf(g,"\n");
           else
        fputc(c,g);
        c=fgetc(f);
    }
  fclose(f);
  fclose(g);
  return 0;
}
