#include <stdio.h>
#include <stdlib.h>

int main()
{
    char str1[31];
    char *str2="2ndstring";
    strcpy(str1, "1234");
    printf("%s %d\n",str1,strlen(str1));
    strcat(str1,str2);
    printf("%s %d\n",str1,strlen(str1));
    strncpy(str1,"1234567",6);
    printf("%s %d\n",str1,strlen(str1));
    return 0;
}
