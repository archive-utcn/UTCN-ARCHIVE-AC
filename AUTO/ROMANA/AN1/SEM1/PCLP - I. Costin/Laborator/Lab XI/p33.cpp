#include <stdio.h>
#include <conio.h>
#include <iostream.h>

struct PROD
{
       int code;
       char name[30];
       char um[5];
       int nrbuc;
       int pret;       
};

PROD p[100];
int n;

int main(void)
{
    FILE *f=fopen("shop.dat","r");
    if(f==NULL){ printf("err la fis de intrare "); exit(1); }
    fscanf(f,"%i",&n);
    for(int i=1;i<=n;i++)
    {
            fscanf(f,"%i %s %s %i %i",&p[i].code,&p[i].name,&p[i].um,&p[i].nrbuc,&p[i].pret);        
    }
    fclose(f);
    for(int i=1;i<n;i++)
    for(int j=i+1;j<=n;j++)
    if(p[i].code>p[j].code )
    {
          PROD aux=p[i];
          p[i]=p[j];
          p[j]=aux;                       
    }
    FILE *g=fopen("shopsort.dat","w");
    fprintf(g,"%i\n",n);
    for(int i=1;i<=n;i++)
    {
            fprintf(g,"%i\n%s\n%s\n%i\n%i\n",p[i].code,p[i].name,p[i].um,p[i].nrbuc,p[i].pret);        
    }
    fclose(g);
  getch();
}
