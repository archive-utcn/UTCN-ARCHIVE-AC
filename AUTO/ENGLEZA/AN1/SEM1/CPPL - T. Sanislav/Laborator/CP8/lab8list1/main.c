#include <stdio.h>

int main()
{
    char ch, string[100], file_name[50] = "file.txt";
    int i = 1;
    FILE *fp;

    fp = fopen(file_name, "w"); //only writing
    printf("Please input a text to store in file \%s\". End with Ctrl+Z.\n", file_name);

    while ((ch = fgetc(stdin)) != EOF) //cat timp ch este diferit de ctrl z care genereaza EOF
    {
        fputc(ch, fp);                  //pune in file textul citit
    }

    fclose(fp); //inchide file

    fp = fopen(file_name, "r+"); //open for both reading and writing
    fseek(fp, 0, SEEK_END);
    printf("\nPlease input the strings to append to the created file. End with NULL and CTRL+Z.\n");

    while(fgets(string, 100, stdin) != NULL)
    {
        fputs(string, fp);
    }
    fclose(fp);

    printf("\nLines of the files (numbered):\n");
    fp = fopen(file_name, "r"); //open only for reading

    while(fgets(string, 100, fp) != NULL) //citeste string din fp
    {
        printf("%d %s", i, string); //int i = 1 e declarat mai sus
        i++;
    }
    fclose(fp);

    return 0;
}
