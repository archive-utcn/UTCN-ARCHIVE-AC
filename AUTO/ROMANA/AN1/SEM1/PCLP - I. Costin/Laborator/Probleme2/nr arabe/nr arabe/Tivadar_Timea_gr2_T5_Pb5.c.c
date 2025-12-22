/*Să se scrie o funcţie care primind ca parametru un număr roman
sub forma unui şir de caractere, returnează numărul respectiv ca număr arab în baza 10.*/

#include<stdio.h>
int arab(char s[])
{
    int n,k=1001,i,j,nr=0;
    n=strlen(s);
    for(i=0;i<n;i++)
    {
        switch( s[i])
        {
        case 'M': j=1000; nr+=1000; break;
        case 'D': j=500; nr+=500; break;
        case 'C': j=100; nr+=100; break;
        case 'L': j=50; nr+=50; break;
        case 'X': j=10; nr+=10; break;
        case 'V': j=5; nr+=5; break;
        case 'I': j=1; nr+=1;break;
        }
        if(j>k)
            nr=nr-2*k;
        k=j;
    }
    return nr;
}
int main()
{
    char s[20];
    printf("introduceti numarul:");
    scanf("%s",s);
    printf("numarul roman %s este numarul %d arab.",s,arab(s));
    return 0;
}
