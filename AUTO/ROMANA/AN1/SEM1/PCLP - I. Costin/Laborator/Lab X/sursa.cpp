#include <stdio.h>
#include <conio.h>
#include <iostream.h>

typedef char sirc[100];
sirc a[100],b[100];
int dim1=0,dim2=0;


void citeste()
{
     FILE *f1=fopen("data1.in","r"),*f2=fopen("data2.in","r");
     if(f1==NULL || f2==NULL){ printf("err la unul din fis de intrare"); getch(); exit(1);}
     while(fgets(a[++dim1],99,f1))
     {
      if(feof(f1)) break;                             
     }
     while(fgets(b[++dim2],99,f2))
     {
      if(feof(f2)) break;                             
     } 
     fclose(f1);
     fclose(f2);   
}

int main(void)
{
    citeste();
    int cont=1;
    for(int i=1,j=1;i<=dim1 && j<=dim2;i++,j++,cont++) if(strcmp(a[i],b[i])!=0) printf("%s diffrent from %s\n",a[i],b[i]);
    printf("remaining lines:\n");
    while(cont<=dim1) printf("%s\n",a[cont++]);
    while(cont<=dim2) printf("%s\n",b[cont++]);
    getch();    
}
