#include <stdio.h>
#include <conio.h>
#include <iostream.h>

typedef char SIRC[100];

SIRC s[100];
int dim=0;

void scrie()
{
     FILE *f=fopen("text.dat","w");
     for(int i=1;i<=dim;i++) fprintf(f,"%s\n",s[i]);
     fclose(f);
}

void citeste()
{
     FILE *f2=fopen("text.dat","r");
     for(int i=1;i<=dim;i++) fgets(s[i],99,f2);
     fclose(f2);
}

int main(void)
{
    printf("citirea se termina la introducerea liniei \"*\"");
    while(1)
    {
         cin.getline(s[++dim],99);
         if(strcmp(s[dim],"*")==0) break;
    }
    scrie();
    citeste();
    for(int i=1;i<=dim;i++) printf("%i %s\n",i,s[i]);
    getch();   
}
