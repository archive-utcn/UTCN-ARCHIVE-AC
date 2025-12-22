#include <stdio.h>
 #include <conio.h>
 #include <io.h>
 #include <fcntl.h>
 #include <sys\stat.h>
 #include <process.h>
 #include <stdlib.h>
/*
90. Sa se scrie un program care citeste un fisier text sursa C si afiseaza frecventele de aparitie ale
cuvintelor rezervate din textul repectiv.
*/
char c[40][40],s[200],aux[200];
int p[40],i,n;

int main()
{
     char numefis1[50]="d:\\pc\\problema90\\test.c";
     int df1=open(numefis1,O_RDONLY);
     strcpy(c[0],"for");
     strcpy(c[1],"if");
     strcpy(c[2],"while");
     strcpy(c[3],"do");
     strcpy(c[4],"int");
     strcpy(c[5],"void");
     strcpy(c[6],"include");
     strcpy(c[7],"char");
     strcpy(c[8],"struct");
     strcpy(c[9],"write");
     strcpy(c[10],"read");
     strcpy(c[11],"printf");
     strcpy(c[12],"scanf");
     // Nu am introdus decat cateva din cuvintele rezervate.Puteti introduce si voi doar sa nu uitati sa modificati n-ul.
     n=12;
     while (read(df1,s,sizeof(s))>0)
     {     // puts(s);
            for(i=0;i<=n;i++)
            {
                strcpy(aux,s);
                while(strstr(aux,c[i]))
                {   p[i]++;
                    strcpy(aux,strstr(aux,c[i])+1);
                }
            }
     }
    for(i=0;i<=n;i++)
        printf("%s apare de %d ori\n",c[i],p[i]);
}
