#include <stdio.h>
#include <conio.h>
#include <string.h>

main()
{ int sp=0,i=0,lmax=0;
  char s[200], cuvc[200]="",cuvm[200]="";
  printf("Give a sentence: \n");
  gets(s);
  while (s[i]==' ')
        i++;
  for (;i<strlen(s);i++)
      { if ( ((s[i]==' ') || (s[i]=='.') || (i==strlen(s)-1) ) && (s[i-1]!=' ') )
           { sp++;
             if ((i==strlen(s)-1)&&(s[i]!='.'))
                { cuvc[strlen(cuvc)+1]='\0';
                  cuvc[strlen(cuvc)]=s[i];
                }
             if (strlen(cuvc)>lmax)
                { lmax=strlen(cuvc);
                  strcpy(cuvm,cuvc);

                }
             while (s[i+1]==' ')
                   i++;
             cuvc[0]='\0';
           }
           else
               { cuvc[strlen(cuvc)+1]='\0';
                 cuvc[strlen(cuvc)]=s[i];
               }
      }
  printf("The sentence has %d words, the longest one has %d letters (%s).",sp,lmax,cuvm);
  getch();
}
