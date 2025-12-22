#include <stdio.h>
#include <stdlib.h>

int main()
{
    char c;
    while (c=getch())
    {
        printf("[%c]=%d \n",c,c);
    }

return 0;
}
