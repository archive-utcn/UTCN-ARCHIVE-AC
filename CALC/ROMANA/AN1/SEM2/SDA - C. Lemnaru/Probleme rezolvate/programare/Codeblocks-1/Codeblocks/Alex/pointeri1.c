#include<stdio.h>
#include<conio.h>

void Max_min1(int n,int a[],int *max, int *min)
{
    int i;
    *max=a[0];
    *min=a[0];
    for(i=1;i<n;i++)
        {
            if(a[i]> *max)  *max=a[i];
            else if(a[i]< *min) *min=a[i];
        }
}
void Max_min2(int n,int *a,int *max, int *min)
{
    int i;
    *max=*a;
    *min=*a;
    for(i=1;i<n;i++)
    {
        if(*(a+i)> *max) *max=*(a+i);
        else if(*(a+i)< *min) *min=*(a+i);
    }
}
int main()
{
    int i,n,maxim,minim;
    int x[100];
    printf("Nr elemente tablou\n=");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("\nx[%d]=",i);
        scanf("%d",&x[i]);
    }
    Max_min1(n,x,&maxim,&minim);
    printf("\n La apel 1 max=%d min=%d",maxim,minim);
    Max_min2(n,&x,&maxim,&minim);
    printf("\n La apel 2 max=%d min=%d",maxim,minim);
    return(0);
}
