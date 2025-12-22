#include <stdio.h>
#define N 100
int main()
{
        FILE *f;
        int i;
        char s[N+1];
        if ((f=fopen("fis.txt","w")==NULL)){
            printf("eroare la creare!");
            return -1;
        }
        fputs("Sir de caractere \n scris in fisier \n",f);
        fclose(f);
        if ((f=fopen("fis.txt","r")==NULL)){
            printf("eroare la deschidere!");
            return -1;
        }
        while((fgets(s,N,f))!=NULL)
        printf("%s\n",s);
        fclose(f);
        return 0;
}



