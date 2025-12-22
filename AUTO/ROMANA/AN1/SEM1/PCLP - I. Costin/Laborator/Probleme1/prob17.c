/* 17. De pe mediul de intrare se citeste un numar natural n. Sa se verifice daca numarul respectiv este
palindrom.*/
#include<stdio.h>
#include<string.h>
#include<conio.h>
int main()
{
int n,m,x=1;
char str[100];
printf("n=");
gets(str);
n=0;
m=strlen(str)-1;
while(n<=m)
{
if(str[n]!=str[m])
x=0;
n++;
m--;
}
if(x==1)
{

printf(" \n numarul este palindrom");
}
else
{

printf(" \n numarul nu este palindrom");
}
return(0);
}

