#include <stdio.h>
#include <stdlib.h>
#include<string.h>

void suma_constante (char sir[80])
{


    double reali[15];

    int i=0,k=0;
    char aux[11];

    while (i<strlen(sir))
    {
        if (sir[i]==' ' )
        {
            strncpy(aux,sir,i);
            aux[i]='\0';
            reali[k]=atof(aux);
            k++;
            strcpy(sir,sir+(i+1));
            i=0;
        }




        i++;
    }
     reali[k]=atof(sir);
                k++;

   int aux_nr;
    int s_int=0; double s_double=0;
    for (i=0; i<k; i++)
    {

        if (reali[i]==(int)reali[i] )
        {
          s_int=s_int+reali[i];
        }
       else s_double=s_double+reali[i];
    }

 printf("\nSumele sunt:\n");
 printf("S_reale: %5.2lf  \nS_intregi: %d\n",s_double,s_int);


}

int main()
{
    char sir[80];
   printf("\nIntroduceti sirul:");
    while(gets(sir))
   {suma_constante(sir);
    printf("\nIntroduceti sirul:");
   }

    return 0;
}
