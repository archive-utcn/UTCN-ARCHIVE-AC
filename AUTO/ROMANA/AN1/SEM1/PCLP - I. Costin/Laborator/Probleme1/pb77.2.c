/*Sa se scrie un program pentru calculul valorii unui polinom de gradul n cu coeficienti complecsi
pentru o valoare complexa. Calculul se va face cu ajutorul unei functii */
#include <stdio.h>
#include <stdlib.h>

struct nr_complex {int re;int im;};
struct nr_complex val[30],x;
int n;
struct nr_complex produs(struct nr_complex a,struct nr_complex b)
    {
        struct nr_complex v;


                v.re=((a.re*b.re)-(a.im*b.im));
                v.im=((a.re*b.im)+(a.im*b.re));

    return v;
    }
void valoare_polinom (struct nr_complex val[],struct nr_complex x)
    {
        struct nr_complex valoare;
        valoare.re=0;
        valoare.im=0;
        int i;
        for (i=n;i>=0;i--)
            {
                valoare=produs(valoare,x);
                valoare.re=valoare.re+val[i].re;
                valoare.im=valoare.im+val[i].im;
            }
    if (valoare.im<0)
    printf("\n\nRezultatul este:\n%d%di",valoare.re,valoare.im);
    else if(valoare.im==0) printf("\n\nRezultatul este:\n%d",valoare.re);
        else printf("\n\nRezultatul este:\n%d+%di",valoare.re,valoare.im);
    }

int main()
{

  printf("Gradul polinomului: ");
  scanf("%d",&n);
  printf("Introduceti coeficientii incepand cu termenul liber:\n");
  int i;
  for (i=0;i<=n;i++)
    {
        printf("\nPartea reala a termenului P[%d]:",i);
        scanf("%d",&val[i].re);
        printf("\nPartea imaginara a termenului P[%d]:",i);
        scanf("%d",&val[i].im);
    }
printf("Valoarea pentru care se calculeaza:\n");
printf("Partea reala a lui X:");
scanf("%d",&x.re);
printf("Partea imaginara a lui X:");
scanf("%d",&x.im);
valoare_polinom(val,x);
    return 0;
}
