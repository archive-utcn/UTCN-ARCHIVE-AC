#include <stdio.h>
#include <stdlib.h>

int main()
{
    char ch, string[100], file_name[50] = "file.txt";
    int i = 1;
    FILE *fp;

    fp = fopen(file_name, "w");
    printf("Please input a text to store in file \"%s\". End with Ctrl+Z.\n", file_name);
    while ((ch=fgetc(stdin)) != EOF) { //aici am citit din consola , am citit caractere din stdin
        fputc(ch, fp);    //am scris caractere ch in fp
    }
    fclose(fp);

    fp = fopen(file_name, "r+");
    fseek(fp, 0, SEEK_END);  //offset este 0, ne deplaseaza cu 0 fata de SEEK_END (seek end este 2, seek start e 0, celalalt este 1 //in loc de ambele functii puteam pune doar "a+" in loc de r+ in prima functie
    printf("\nPlease input the strings to append to the created file. End with Ctrl+Z.\n");
    while (fgets(string, 100, stdin) != NULL) { //citim string, maxim 100 caractere, citim din stdin
        fputs(string, fp);    //scriem un string in fp
    }
    fclose(fp);

    printf("\nLines of the files (numbered):\n");
    fp = fopen(file_name, "r");
    while (fgets(string, 100, fp) != NULL) {
        printf("%d %s", i, string);
        i++;
    }
    fclose(fp);
    return 0;
}
