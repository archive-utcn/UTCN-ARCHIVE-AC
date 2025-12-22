#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
FILE *f,*g;
int main()
{
    char c[100][100];
    f=fopen("fis1.txt","r+");
    g=fopen("fis2.txt","w");

    fscanf(f,"%s",&c);
    fprintf(g,"%s",c);

    fclose(f);
    fclose(g);
}
