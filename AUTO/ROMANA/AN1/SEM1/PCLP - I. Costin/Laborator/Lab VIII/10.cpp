#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <stdlib.h>

void inv(char c[])
{
  int i,n;
  char aux;
  n=strlen(c)-1;
  for (i=0;i<=(strlen(c)-1)/2;i++)
    {
      aux=c[i]; 
      c[i]=c[strlen(c)-1-i]; 
      c[strlen(c)-1-i]=aux;
    }
}

void sum(char a[],char b[], char c[])//calculate the sum of 2 large decimal numbers
{
  int i,j,k,l,t,aux;
  i=strlen(a)-1;
  j=strlen(b)-1;
  k=-1;
  t=0;
  while ((i>=0)&&(j>=0))
    {
      k++;
      aux=a[i]+b[j]+t-96;  
      t=aux/10; 
      c[k]=aux%10+48;
      c[k+1]=0;
      i--;
      j--; 
    }           
  if (i>=0) 
    for (;i>=0;i--)
      {
         k++;
         aux=a[i]+t-48; 
         t=aux/10;
         c[k]=aux%10+48; 
         c[k+1]=0;   
      }  
  else 
    if (j>=0)
      for (;j>=0;j--)
         {  
             k++;
             aux=b[j]+t-48; 
             t=aux/10;
             c[k]=aux%10+48; 
             c[k+1]=0;
         }       
  if ((i<0)&&(j<0)&&(t>0))
     {
       k++;
       c[k]=t+48;
       c[k+1]=0;
     }
  inv(c);
}

int main()
{
  char a[100],b[100],c[100],d[100];
  int i,n;
  printf("\n Please input the two numbers: \n");
  printf("\n Input the number a: \n ");
  gets(a);
  printf("\n Input the number b: \n");
  gets(b);
  sum(a,b,c);//we calculate the sum a+b in c   
  printf("\n The sum of the 2 large decimmal numbers is: \n ");//we display the sum
  puts(c);
  n=strtol(b,NULL,0);   
  getch();
}
