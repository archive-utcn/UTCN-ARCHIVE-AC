#include <stdio.h>
#include <conio.h>
#include <iostream.h>

typedef char sirc[100];

sirc keyw[]={"while","for","if","char","float","long","const","double","else","case","switch","int"};
int dimk=12;
int frq[13];
sirc s[100];
int dim=0;

void citeste()
{
     FILE *f=fopen("sursa.cpp","r");
     if(f==NULL){ printf("err la fis de intrare"); getch(); exit(1); }
     while(fgets(s[++dim],99,f))
     {
      if(feof(f)) break;                           
     }
}

int main(void)
{
    citeste();
    for(int i=1;i<=dim;i++)
    {
     for(int j=0;j<dimk;j++)
     { 
      char *p=strstr(s[i],keyw[j]);
     if(p!=NULL) frq[j]++;
     /// char *p1;
     // while(p!=NULL)
     // {
       //     frq[j]++;
        //    p1=p;
         //   p=strstr(p1,keyw[j]);              
            
     // }
     }//for j
    }  
    for(int i=0;i<dimk;i++)
    {
            printf("%s %i\n",keyw[i],frq[i]);        
    }
    getch();    
}
