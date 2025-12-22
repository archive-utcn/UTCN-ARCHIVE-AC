#include <stdio.h>
#include <stdlib.h>
/*Un sofer doreste sa conduca din orasul A în orasul B, între care distanta este de n * 10 km (n numar
întreg >=1). Începând cu punctul de plecare A (inclusiv) exista benzinarii (numerotate începând cu 0) la
fiecare 10 km. Masina soferului consuma 1 litru de benzina la fiecare 10 km si are o capacitate a
rezervorului de c litri (c numar întreg >=1). Soferul are la dispozitie o harta în care este trecut pretul la
fiecare benzinarie.
Sa se scrie un program care sa indice de unde si în ce cantitate trebuie sa cumpere soferul benzina pentru a
parcurge drumul cu cost minim, si care este acest cost. Programul va afisa o singura solutie. Initial masina nu
are benzina în rezervor, iar de la o benzinarie soferul poate cumpara orice cantitate de benzina, în limitele
capacitatii rezervorului.
Exemplu:
Fisierul de intrare:
5 2
2.9 3.1 2.8 3.3 2.9
Iesirea programului:
Cumpara 2 l de la benzinaria 0
Cumpara 2 l de la benzinaria 2
Cumpara 1 l de la benzinaria 4
Cost total: 14.3
*/
typedef struct nod
    {
        int nr;
        float pb;
        struct nod *urm;
    }benzinarie;

int n,c;
benzinarie *prim,*ultim;
float cost;

void citire()
{
    FILE *f;
    int i;
    float k;
    benzinarie *p;
    prim=0;
    ultim=0;
    f=fopen("benzinarii.txt","r");
    fscanf(f,"%d %d",&n,&c);
    for(i=0;i<n;i++)
        {
            p=(benzinarie*)malloc(sizeof(benzinarie));
            fscanf(f,"%f",&k);
            p->pb=k;
            p->nr=i;
            p->urm=0;
            if(prim==0)
                {
                    prim=p;
                    ultim=p;
                }
            else
                {
                    ultim->urm=p;
                    ultim=p;
                };
        };
    p=(benzinarie*)malloc(sizeof(benzinarie));
    p->pb=3000;
    p->nr=n;
    p->urm=0;
    ultim->urm=p;
    ultim=p;
    fclose(f);
};

void benzina_minima()
{

    benzinarie *p,*q,*r,*s,*w,*z;
    int br,i,ct;
    float min;
    br=0;
    p=prim;
    while(p->pb!=3000)
    {
        q=p->urm;
        min=3000;
        r=q;
        i=1;
        while((i<c)&&(q->nr!=n))
            {
                if(q->pb<min)
                {
                    min=q->pb;
                    r=q;
                };
                q=q->urm;
                i++;
            };
        if((q->nr==n)&&(br>=n-p->nr)) p=q;
        else
            if(p->pb<=min)
                if(min<q->pb)
                    {
                        ct=c-br;
                        printf("\n De la benzinaria %d cumpara %d l ",p->nr,ct);
                        cost+=p->pb*ct;
                        br+=ct;
                        ct=r->nr-p->nr;
                        p=r;
                        br=br-ct;
                    }
                else
                    {
                        if(q->nr==n) ct=n-p->nr;
                        else ct=c-br;
                        printf("\n De la benzinaria %d cumpara %d l ",p->nr,ct);
                        cost+=p->pb*ct;
                        br+=ct;
                        ct=q->nr-p->nr;
                        p=q;
                        br=br-ct;

                    }
            else
                    if (br>=(r->nr-p->nr))
                        {
                            br=br-(r->nr-p->nr);
                            p=r;
                        }
                    else
                     {
                        s=r;
                        while((p->pb>min)&&(p->urm!=r))
                            {
                                w=r;
                                min=3000;
                                q=p->urm;
                                z=q;
                                for(i=1;i<(r->nr-p->nr);i++)
                                {
                                    if(q->pb<min)
                                        {
                                            min=q->pb;
                                            z=q;
                                        };
                                    q=q->urm;
                                };
                                r=z;
                            };
                        if(min>=p->pb)
                            if(w==s)
                              {
                                ct=w->nr-p->nr;
                                printf("\n De la benzinaria %d cumpara %d l ",p->nr,ct-br);
                                cost+=p->pb*(ct-br);
                                br=0;
                                p=w;
                              }
                            else
                                {
                                    if(br>=(w->nr-p->nr))
                                        {
                                            br=br-(w->nr-p->nr);
                                             p=w;
                                        }
                                    else
                                        {
                                             ct=w->nr-p->nr;
                                             printf("\n De la benzinaria %d cumpara %d l",p->nr,ct-br);
                                             cost+=p->pb*(ct-br);
                                             br=0;
                                             p=w;
                                        }

                                }
                        else
                            if(br>=(r->nr-p->nr))
                                {
                                     br=br-(r->nr-p->nr);
                                     p=r;
                                }
                            else
                                {
                                     ct=r->nr-p->nr;
                                     printf("\n De la benzinaria %d cumpara %d l ",p->nr,ct-br);
                                     cost+=p->pb*(ct-br);
                                     br=0;
                                     p=r;
                                }
                     }
       /* else */
    }
}

int main()
{
    citire();
    cost=0;
    benzina_minima();
    printf("\n Costul total este: %.2f \n",cost);
    return 0;
}














