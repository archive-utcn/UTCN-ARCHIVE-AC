#include <stdio.h>
#include <conio.h>
#include <iostream.h>


char text[200];
char comp[200];
int dc=0;
int dim=0;
char ctrl;

void compress(char fin[])
{
     FILE *f=fopen(fin,"r");
     if(f==NULL){ printf("err la fis de intr"); getch(); exit(1); }
     char c;
     while ((c=getc(f))!=EOF) text[dim++]=c;
     text[dim]='\0';
     for(int i=0;i<dim;i++)
     {
             int cont=i+1;
             while(text[i]==text[cont]) cont++;
             cont--;
             if(cont>=4)
             {
             comp[dc++]=ctrl;
             comp[dc++]=text[i];
             comp[dc++]=cont+'0';
             }
             
     }
     fclose(f);
}

void decompress(char fin[])
{
     
}

int main(void)
{
    char fis[15];
    printf("datzi fisierul...");
    scanf("%s",fis);
    printf("datzi caracterul de control...");
    cin>>ctrl;
    compress(fis);
    decompress(fis);
    getch();   
}
