/*60. Un sofer doreste sa conduca din orasul A în orasul B, între care distanta este de n * 10 km (n numar
întreg >=1). Începând cu punctul de plecare A (inclusiv) exista benzinarii (numerotate începând cu 0) la
fiecare 10 km. Masina soferului consuma 1 litru de benzina la fiecare 10 km si are o capacitate a
rezervorului de c litri (c numar întreg >=1). Soferul are la dispozitie o harta în care este trecut pretul la
fiecare benzinarie.
Sa se scrie un program care sa indice de unde si în ce cantitate trebuie sa cumpere soferul benzina pentru a
parcurge drumul cu cost minim, si care este acest cost. Programul va afisa o singura solutie. Initial masina nu
are benzina în rezervor, iar de la o benzinarie soferul poate cumpara orice cantitate de benzina, în limitele
capacitatii rezervorului.*/
#include <stdio.h>
#include <stdlib.h>
float pret[20];
int n,c;
float cost;

void citireDate()
{
    FILE *f;
    int i;
    f=fopen("date.txt","r");
    fscanf(f,"%d %d",&n,&c);
    for(i=0;i<n;i++)
    {
        fscanf(f,"%3f",&pret[i]);
    }
}

void consumOptim(int i)
{
    int j;
    float min=1000;
    int limit=c+i<n?c+i:n;
    int pos;
    if(i<n)
    {
        for(j=i+1;j<=limit;j++)
        {
            if(pret[j]<min)
            {
                min=pret[j];
                pos=j;
            }
        }
        printf("\nCumpara %d litri de la benzinaria %d",pos-i,i);
        cost=cost+ (pos-i)*pret[i];
        consumOptim(pos);
    }
    else
    return ;
}


int main()
{
    citireDate();
    consumOptim(0);
    printf("\n%2.2f",cost);
    return 0;
}
