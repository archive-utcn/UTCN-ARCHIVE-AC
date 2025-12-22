#include <stdio.h>
#include <stdlib.h>
/*
87. Sa se scrie programul pentru concatenarea a doua sau mai multe fisiere ce contin numere reale. Se
va tipari informatia din fisierul rezultat.
*/
int main()
{   FILE *in1,*in2;
    if((in1=fopen("nr1.txt","r+"))==NULL)
        printf("Fisierul nr1.txt nu exista");
    if((in2=fopen("nr2.txt","r"))==NULL)
        printf("Fisierul nr2.txt nu exista");
    float x,ok=0;
    fseek(in1,0L,SEEK_END);
    while(!feof(in2))
    {
        fscanf(in2,"%f ",&x);
        fprintf(in1," %.3f ",x);
        ok=1;
    }
    if(ok)
    printf("Numerele din fisierul nr2.txt au fost copiate");
    else printf("Probleme la copiere");


    return 0;
}
