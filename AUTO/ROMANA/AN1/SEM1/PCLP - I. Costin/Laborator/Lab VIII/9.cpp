#include<stdio.h>
#include<conio.h>
#include<string.h>

struct kn{ char a[100]; int b,d;};
typedef kn king;

void read(king e[100],int n)
{ 
  int i;
  for(i=0;i<n;i++)
    { 
       printf("\n Name ");
       scanf("%s",&e[i].a);
       printf("\n Limit years ");
       scanf("%i%i",&e[i].b,&e[i].d);
    }
}

void sort(king e[100], int n)
{ 
  int i,ok; king aux;
  do
    { 
      ok=1;
      for(i=0;i<n-1;i++)
             if(strcmp(e[i].a,e[i+1].a)>0)
                { 
                  aux=e[i];
                  e[i]=e[i+1];
                  e[i+1]=aux;
                  ok=0;
                }
      }
     while(!ok);
}

void display(king e[100], int n)
{   
    int i;
    for(i=0;i<n;i++)
        { 
           printf("\n Name %s",e[i].a);
           printf("\n Number of years of domination %i",(e[i].d-e[i].b));
           printf("\n");
         }  
}

int main()
{ 
  king e[100]; int n;
  printf("\n Number of kings ");
  scanf("%i",&n);
  read(e,n);
  sort(e,n);
  display(e,n);
  getch();
}
