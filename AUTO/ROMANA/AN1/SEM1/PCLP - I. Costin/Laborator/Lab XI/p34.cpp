#include <stdio.h>
#include <conio.h>
#include <iostream.h>
#include <string.h>

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

void adauga()
{
     int cod,nrbuc,pret;
     char name[30],um[5];
   printf("codul produsului...");
         scanf("%i",&cod);
         printf("numele produsului...");
         cin>>name;
         printf("unitatea de masura a produsului...");
         cin>>um;
         printf("nr de bucati ale produsului...");
         scanf("%i",&nrbuc);
         printf("pretul  produsului...");
         scanf("%i",&pret);
         n++;
         p[n].code=cod;   
         strcpy(p[n].name,name);   
         strcpy(p[n].um,um);   
         p[n].nrbuc=nrbuc;   
         p[n].pret=pret;   
         getch();
}

void iesire()
{
     FILE *out=fopen("shop.dat","w");
     fprintf(out,"%i\n",n);
     for(int i=1;i<=n;i++)     
     fprintf(out,"%i\n%s\n%s\n%i\n%i\n",p[i].code,p[i].name,p[i].um,p[i].nrbuc,p[i].pret);
     fclose(out);
     exit(1);
}

void sterge()
{
     int cd,poz=-1;
     printf("introduceti codul produsului care va fi scos din magazin...");     
     scanf("%i",&cd);
     
     for(int i=1;i<=n;i++) if(p[i].code==cd) poz=i;
     
     if(poz!=-1)
     {
                for(int i=poz;i<n;i++) p[i]=p[i+1];
                n--;          
     }
     else printf("nu sa gasit produsul cu codul introdus");
     getch(); 
}

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
    system("cls");
    char c;
    while(1)
    {
       printf("1. Pt adaugare apasati A\n");
       printf("2. Pt stergere apasati S\n");
       printf("3. Pt iesire apasati X\n");
       c=getch();
       switch(c)
       {
                case 'a': adauga(); system("cls"); break;
                case 's': sterge(); system("cls"); break;
                case 'x': iesire(); system("cls"); break;
                default: printf("Comanda necunoscuta"); getch(); system("cls"); break;
      } 
    }
}
