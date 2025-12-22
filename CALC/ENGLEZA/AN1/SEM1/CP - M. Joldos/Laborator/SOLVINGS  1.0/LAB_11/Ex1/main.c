//high level file processing  * first example
#include <stdio.h>
#include <stdlib.h>

int main()
{
    char ch,s[100],file_name[50]="file1.txt";
    int i;
    FILE *pf;
    //create a file and write all read characters from stdin

    pf=fopen(file_name,"w");
    printf("\nPlease input a text to store in file \"%s\".\ End with CTRL+Z\n",file_name);
    while((ch=getc(stdin)) != EOF)
    {
        putc(ch,pf);
    }
    fclose(pf);

    //apend char strings
    pf=fopen(file_name,"r+");
    fseek(pf,0l,2);
    printf("Please input the strings you want to append to the created file.End with an empty line.\n");
    while(fgets(s,100,stdin)!=(char*)0)
    {
        fputs(s,pf);
    }
    fclose(pf);
    //show file contents
    printf("Lines of the files (numbered):\n");
    i=0;
    pf=fopen(file_name,"r");
    while(fgets(s,100,pf)!=(char*)0)
    {
        printf("%d %s",i,s);
        i++;
    }
    fclose(pf);
    getch();
    unlink(file_name);


    return 0;
}
