#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>
#include <string.h>
int main()
{
    time_t ref, now;
    static char timeString[1024];

    ref=time(NULL);
    for (;;)
    {
        now=time(NULL);
        if (difftime (now, ref) !=0)
        {
            ref=now;

            printf("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b");
            sprintf(timeString, "%s", ctime(&now));
            timeString[strlen(timeString)-1] = '\0';
            printf("%s", timeString);
        }
    }
    return 0;
}
