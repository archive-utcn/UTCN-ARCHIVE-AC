/*43. De pe mediul de intrare se citeste un numar întreg, multiplu de 100, care reprezinta o 
anumita suma de bani în LEI. Sa se scrie o functie care determina modul de plata a respectivei
sume, astfel ca sa se foloseasca un numar minim de bancnote.*/

#include<stdlib.h>
#include<stdio.h>

void plata(int a)
{
    int c,i,b[3]={500,200,100};
    for(i=0;i<3;i++)
    {
        c=0;
        while(a-b[i]>=0)
        {
            a-=b[i];
            c++;
        }
        if(c!=0)
            printf("  %d x %d\n",b[i],c);
    }
}

main()
{
    int s;
    printf("Intrdouceti suma(multiplu de 100) s=");
    scanf("%d",&s);
    printf("Suma de %d se poate plati astfel:\n",s);
    plata(s);
    getch();
    return 0;
}
