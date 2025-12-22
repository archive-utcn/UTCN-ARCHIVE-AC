#include <stdio.h>
#include <stdlib.h>
#include <string.h>

 char s[30];

char *extract(char *s,unsigned int pos,int length)
{

    if(!s)
        return NULL;
    if(length==0 || pos > strlen(s) )
        return NULL;
    unsigned size=length+1;
    if(strlen(s)-pos +1< size)
    {
        size=strlen(s)-pos+1;
    }
    char *extracted_string = malloc(size);
    memset(extracted_string, '\0',size);

    strncpy(extracted_string, &s[pos], length);
    return extracted_string;
}

int main()
{

    unsigned int pos,length;
    printf("Introduce the string : ");
    scanf("%s", s);
    printf("\nIntroduce the position and the length : ");
    scanf("%u %u", &pos,&length);

    printf("%u %u %s", pos, length, extract(s,pos,length));


    return 0;
}
