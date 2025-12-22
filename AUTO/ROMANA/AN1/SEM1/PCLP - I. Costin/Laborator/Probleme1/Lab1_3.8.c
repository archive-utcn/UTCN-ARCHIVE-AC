#include<conio.h>
#include<stdio.h>
#include<string.h>
int main(void)
{
    char a[100];
    int i,n;

    printf("Dati sirul de caractere ");
    gets(a);
    for(i=0;i<strlen(a);i++)
    if(a[i]!=32)
    a[i]=a[i]+32;
   puts(a);
    return(0);
}
