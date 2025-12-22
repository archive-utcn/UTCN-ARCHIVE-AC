#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{

    int n, i,j,gata, mini,minj,aux;
    struct oras{float x;
                 float y;
                 int cc;
                };
   float min;
printf("Introduceti numarul de orase:\n");
    scanf("%d", &n);


struct oras tzara[n];
float distanta[n][n];

for (i=0;i<n;i++)
{
   printf("Introduceti x:\n");
    scanf("%f", &tzara[i].x);
    printf("Introduceti y:\n");
    scanf("%f", &tzara[i].y);
tzara[i].cc=i;
}

for (i=0;i<n;i++)
for (j=0;j<n;j++)
{
    if (i==j) distanta[i][j]=0;
    else
    distanta[i][j]= sqrt((tzara[i].x-tzara[j].x)*(tzara[i].x-tzara[j].x)+(tzara[i].y-tzara[j].y)*(tzara[i].y-tzara[j].y));
}


 gata = 0;
while (gata == 0)

{
    printf("*******1");

    for (i=0;i<n;i++)
for (j=0;j<n;j++)
{
    if (distanta[i][j] != 0) {min=distanta[i][j]; mini=i; mini=j;}
}

 printf("*******2");
for (i=0;i<n;i++)
for (j=0;j<n;j++)
{
    if ((distanta[i][j] < min ) && (distanta[i][j] != 0 )) {mini = i; minj=j; min = distanta[i][j];}
}
 printf("*******3");
 printf("cc1 %d si cc2 %d ", tzara[mini].cc,tzara[mini].cc);

if (tzara[mini].cc != tzara[minj].cc)
{
 printf("*******3.1");
    aux=tzara[minj].cc;
             printf("*******3.2");
            for (i=0;i<n;i++)
             if (tzara[i].cc==aux) tzara[i].cc=tzara[mini].cc;
            printf("nodul %d a fost conectat la nodul %d la o distanta de %f", mini, minj, min);

}
 printf("*******4");
distanta[mini][minj]=0;
distanta[minj][mini]=0;
for (i=1;i<n;i++) if (tzara[i-1].cc == tzara[i].cc) gata=1; else gata =0;
 printf("*******5");
}

return 0;






}
