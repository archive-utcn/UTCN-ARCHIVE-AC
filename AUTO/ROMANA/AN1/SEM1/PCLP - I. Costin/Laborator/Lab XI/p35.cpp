#include <stdio.h>
#include <conio.h>
#include <iostream.h>

struct ELEV
{
       char nume[30];
       char pre[30];
       char spec[30];
       float bac;
       float mate;
       float med;  
};

ELEV e[100];
int n=0;


void citire()
{
     printf("Numarul de studenti...");
     scanf("%i",&n);
     for(int i=1;i<=n;i++)
     {
             printf("numele...");
             cin>>e[i].nume;
             printf("prenumele...");        
             cin>>e[i].pre;
             printf("specializarea...");
             cin>>e[i].spec;
             printf("bac...");        
             scanf("%f",&e[i].bac);             
             printf("mate...");
             scanf("%f",&e[i].mate);
             e[i].med=(float)(e[i].bac+e[i].mate*4)/5;
     }
}

int main(void)
{
    citire();
    for(int i=1;i<n;i++)
    for(int j=i+1;j<=n;j++)
    if(e[i].med <e[j].med)
    {
     ELEV aux=e[i];
     e[i]=e[j];
     e[j]=aux;
     }
    FILE *o1=fopen("admisi.txt","w");
    for(int i=1;i<=n && (e[i].med>=5);i++)
    fprintf(o1,"%s\n%s\n%s\n%f\n%f\n%f\n",e[i].nume,e[i].pre,e[i].spec,e[i].bac,e[i].mate,e[i].med);
    fclose(o1);
    
    for(int i=1;i<n;i++)
    for(int j=i+1;j<=n;j++)
    if(strcmp(e[i].nume ,e[j].nume)>0)
    {
     ELEV aux=e[i];
     e[i]=e[j];
     e[j]=aux;
     }
     
     FILE *o2=fopen("respinsi.txt","w");

    for(int i=1;i<=n ;i++)
    if(e[i].med<5)
    fprintf(o2,"%s\n%s\n%s\n%f\n%f\n%f\n",e[i].nume,e[i].pre,e[i].spec,e[i].bac,e[i].mate,e[i].med);
    fclose(o2);
   getch();
}
