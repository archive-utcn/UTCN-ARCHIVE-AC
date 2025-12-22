#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <string.h>

int main()
{
    char timeString[1024];
    time_t now,ref;

    ref=time(NULL);
    for(;;)
    {
        now=time(NULL);
        if(difftime(now,ref) != 0)
        {
            ref=now;
            printf("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b");
            sprintf(timeString,"%s",ctime(&now));
            timeString[strlen(timeString)-1]='\0';
            printf("%s",timeString);
        }
    }



    return 0;
}
