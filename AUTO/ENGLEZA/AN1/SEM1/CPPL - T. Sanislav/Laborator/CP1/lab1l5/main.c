#include <stdio.h>
#include <stdlib.h>

int main()
{
    char name[50] = "";
    char cp[100] = "";
    char *description="You learn how to write a computer program.\n";

    printf("What is your name?\n");
    gets(name);
    printf("___________________\n");
    printf("Well, %s, what do you study?\n",name);
    gets(cp);
    printf("__________________\n");
    puts("Let me see if I got it:");
    puts(description);

    return 0;

}
