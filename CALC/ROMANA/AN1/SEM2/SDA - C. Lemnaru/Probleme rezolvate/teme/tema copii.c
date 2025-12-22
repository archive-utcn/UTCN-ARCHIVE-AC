#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct NOD
{
    int key;
    struct Nod *urm;
    char s[20];
} nod;
int main()
{
    int n,i=1,m;
    nod *p,*q,*ptr;
    char nume[15];

    printf("Introduce-ti numarul: \n");
    scanf("%d",&n);

    p=(nod*)malloc(sizeof(nod));
    printf("Introduce-ti numele copilului %d: \n",i);
    scanf("%s",nume);
    p->urm=p;

    strcpy(p->s,nume);
    ptr=p;
    p->key=i;
    for(i=2; i<=n; i++)
    {
        p=(nod*)malloc(sizeof(nod));
        printf("Introduce-ti numele copilului %d: \n",i);
        scanf("%s",nume);
        p->urm=ptr->urm;
        ptr->urm=p;
        ptr=p;
        p->key=i;
        strcpy(p->s,nume);

    }

    i=1;
    p=ptr;

    m=n;
    while (m!=1)
    {
        for (i=0; i<n-1; i++)
        {
            p=p->urm;
        }
        q=p->urm;
        p->urm=q->urm;
        q->urm=NULL;
        ptr=p;
        m=m-1;


        do
        {
            printf("%s ",p->s);
            printf("%d \n",p->key);

            p=p->urm;
            i++;

        }
        while(p!=ptr);
        printf("\n");
    }
    return 0;
}
