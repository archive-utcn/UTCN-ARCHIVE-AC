#include <stdio.h>
#include <stdlib.h>

int main()
{
    char s[30];
    scanf("%s",&s);
   for(int i=0;i<strlen(s);i++)
   {
       printf("%c",s[i]-32);
   }

    return 0;
}
