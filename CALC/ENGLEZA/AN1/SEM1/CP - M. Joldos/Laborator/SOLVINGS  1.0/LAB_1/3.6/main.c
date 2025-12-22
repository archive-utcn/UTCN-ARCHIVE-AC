#include <stdio.h>
#include <stdlib.h>

int main()
{
    char s[30];
    printf("Hello, what's your name?\n");
    gets(s);
    printf("Nice to meet you, %s!",s);

    return 0;
}
