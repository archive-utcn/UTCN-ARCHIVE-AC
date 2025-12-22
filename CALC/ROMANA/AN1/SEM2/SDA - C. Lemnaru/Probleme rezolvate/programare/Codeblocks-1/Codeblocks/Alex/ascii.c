#include<stdio.h>
#include<string.h>
int main()
{
    char x[50],i;
    printf("Sirul de caractere este:");
    scanf("%s",&x);
    for(i=0;i<50;i++)
    {
    if(x[i]>65 && x[i]<97)
    x[i]=x[i]+32;}
    printf("%s",x);
}


