#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

int a[20],nr[20],x[20];
int n,B,s,i;

void back(int);
int continuare(int);
void memsol();

int main()
{
    printf("Introduceti n : ");
    /*
    scanf("%d",&n);

    for(i=0;i<n;i++)
    {
        printf("a(%d),nr(%d): ",i,i);
        scanf("%d %d",&a[i],&nr[i]);
    }


    printf("B: ");
    scanf("%d",&B);
    */
    n=2;
    a[0]=1;nr[0]=3;
    a[1]=2;nr[1]=2;

    s=0;
    B=4;
    back(0);
return 0;
}
void back(int k)
{
    if(k==n) {
        //k=n+1;
        memsol();
    }
    else
      {
        for(i=0;i<nr[k];i++)
         {
             x[k]=i;
             s=s+a[k];
             if(continuare(k)) back(k+1);
             //printf("%d ",s);
             s=s-a[k];
             //printf("%d ",s);
         }
      }
}
int continuare(int k)
{
    if(k==n && s==B)
        return 0;
    else
        return 1;
}
void memsol()
{
    for(i=0;i<n;i++)
     printf("sol %d  %d\n",x[i],a[i]);
}
