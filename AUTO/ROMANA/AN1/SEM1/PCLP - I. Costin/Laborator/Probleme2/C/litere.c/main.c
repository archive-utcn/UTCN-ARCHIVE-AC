#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main()
{
    char a[50];
    int i;
    scanf("%s", &a);
    for(i=0; i<strlen(a); i++)
       {
        a[i]=a[i]-32;
        printf("%c", a[i]);
       }
    return 0;
}
