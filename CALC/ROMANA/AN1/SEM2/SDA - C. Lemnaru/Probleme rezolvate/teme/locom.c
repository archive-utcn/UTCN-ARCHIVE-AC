#include <stdio.h>
#include <stdlib.h>

typedef struct NOD {
int cheie;
struct NOD *urm;
} nod;

FILE *f;
nod *prim,*ultim,*q,*q1,*p;
void adaug()
{
char nume[20];
p=(nod*)malloc(sizeof(nod));
  printf("nume fis text=");
    scanf("%s",nume);

f=fopen(nume,"r+");
fputs()


if (prim==0){
    prim=p;ultim=p;
}
else {
    p->urm=0;
    if(ultim!=0)ultim->urm=p;
    else prim=p;
    ultim=p;
}

}
void sterg(int key)
{
q1=0; q=prim;
while (q!=0)
{
if(q->cheie == key) break;
q1=q; q=q->urm;
}
if(q != 0)  {
if (q == prim) {
prim=prim->urm;
free(q);
if( prim==0) ultim=0;
}
else {
q1->urm=q->urm;
if(q==ultim)  ultim=q1;
free(q);
}


}
}
void afis(int key)
{
p=prim;

while(p->urm!=0)
    if(p->cheie=key)
    printf("%d\n",p->cheie);
    else p=p->urm;
}
/*void afisare()
 {
     p=prim;
     printf("%s",p->tip);

     while(p->urm!=0)
     {
         p=p->urm;
         printf("%s ",p->tip);


     }
*/
int main()
{
    int j,k;

printf("dati cheia");
scanf("%d",&k);




    printf("\t\t MENIU\n\n\n\n\n");
    printf("1-adaugare\n");
    printf("2-stergere\n");
    printf("3-afisare\n");
    printf("4-iesire\n");

    while (j!=4)
    {
        printf("\n\nIntrodu optiunea dorita: ");
        scanf("%d",&j);
        switch(j)
        {
        case 1:

            adaug();
            break;
        case 2:
            sterg(k);
            break;
        case 3:
            afis(k);
            break;

        case 4:
            printf("\n iesi acas' !!!");
            break;
        default:
            printf("nui bine ce-ai bagat fraere");

        }


    }
    return 0;
}
