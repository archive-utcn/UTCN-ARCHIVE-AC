#include <stdio.h>
#include <stdlib.h>

char words[300][300];

int main()
{
    char s[300],*p,del[5]=" ,.;";
    int i=0,max_length=0,length,max_pos;

    gets(s);

    p=strtok(s,del);
    while(p)
    {
        strcpy(words[i],p);
        length=strlen(p);
        if(length>max_length)
        {
            max_length=length;
            max_pos=i;
        }
            i++;
        p=strtok(NULL,del);
    }
    printf("There are %d words and the longest one is %s",i,words[max_pos]);
    return 0;
}
