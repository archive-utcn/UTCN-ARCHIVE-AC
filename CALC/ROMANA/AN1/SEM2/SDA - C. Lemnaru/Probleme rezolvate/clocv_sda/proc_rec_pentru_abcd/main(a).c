#include <stdio.h>
#include <stdlib.h>

//Programul citeste elementele unei liste simplu inlantuite si le afiseaza in ordinea citirii si apoi in ordine inversa

typedef struct tip_nod{   //declarare structura nod
                        int data;
                        struct tip_nod *urm;
                      }tip_nod;


void invers(tip_nod **p) //proc recursiva ce face afisarea inversa
{   tip_nod *c;
    if ((*p)->urm!=0) //verificarea daca s-a ajuns la finalul listei
    {c=(*p)->urm;
     invers(&c);}  //autoapel
    printf("%d\n",(*p)->data); //printarea informatiei de la nivelul curent al stivei
    return 0;
}


int main()
{
    int n,i;
    tip_nod *prim,*ultim,*p,*q;
    printf("Nr. elemente:");
    scanf("%d",&n);  //citire nr de elemente
    printf("Elementele:");
    prim=(tip_nod*)malloc(sizeof(tip_nod));  //alocare memorie pt primul nod
    scanf("%d",&(prim->data));  //citire informatie pt primul nod
    prim->urm=0;
    ultim=prim;
    p=prim;

    for (i=1;i<n;i++)  //citire noduri
    {
        p=(tip_nod*)malloc(sizeof(tip_nod)); //alocare memorie
        scanf("%d",&(p->data));  //citire informatie
        ultim->urm=p;  //adaugare la lista deja formata
        p->urm=0;
        ultim=p;  //nodul curent devine ultimul din lista
    }
    p=prim;
    printf("Ordinea initiala:\n");
    for (i=0;i<n;i++)
    {
        printf("%d\n",p->data);
        p=p->urm;
    }
    printf("Ordinea inversa:\n");
    invers(&prim);
    return 0;
}


