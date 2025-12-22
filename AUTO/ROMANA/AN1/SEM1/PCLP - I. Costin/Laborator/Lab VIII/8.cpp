#include<stdio.h>
#include<conio.h>
#include<string.h>

struct book { char a[100],t[100]; int y;};
typedef book  bi;
void read(bi e[100],int n)
{ 
  printf("\n Input the publication ");
  int i;
  for(i=0; i<n; i++)
  {
    printf("\n Author "); 
    scanf("%s",&e[i].a);
    printf("\n Title ");
    scanf("%s",&e[i].t);
    printf("\n Publication year "); 
    scanf("%i",&e[i].y);
    printf("\n");
  }
}

void alfa(bi e[100], int n)
{ 
  int ok,i;bi aux;
  do
    { 
      ok=1;
      for(i=0;i<n-1;i++)
         if(strcmp(e[i].a,e[i+1].a)>0)
             {  
               ok=0;
               aux=e[i];
               e[i]=e[i+1];
               e[i+1]=aux;
             }
      }
     while(!ok);
}

void py(bi e[100], int n)
{ 
  int i,ok; bi aux;
   do
     { 
         ok=1;
         for(i=0;i<n-1;i++)
               if(e[i].y>e[i+1].y)
                  {
                     ok=0;
                     aux=e[i];
                     e[i]=e[i+1];
                     e[i+1]=aux;
                  }
      } 
     while(!ok);
}

void display(bi e[100],int n,int a)
{ 
  int i;
  for(i=0;i<n;i++)
     {  
         printf("\n Author  %s",e[i].a);
         if(!a)
           { 
               printf("\n Title  %s",e[i].t);
               printf("\n Publication year %i",e[i].y);
            }
      }
}
int main()
{ 
   int n; bi e[100];
   printf("\n Number of publications ");
   scanf("%i",&n);
   read(e,n);
   //alfa(e,n);
   py(e,n);
   display(e,n,0);
   getch();
}
