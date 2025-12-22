/*3. Sa se scrie programul care creeaza doua liste ordonate crescator dupa o cheie numerica si apoi le
interclaseaza.*/
#include <stdio.h>
#include <stdlib.h>

typedef struct n{
    int key;
    struct n *next,*prev;
}node;

node *first1,*last1,*first2,*last2;
int m,n;

void adaugareNod(node **first,node **last,node *p)
{
    node *q;

    if(!(*first))
    {
        *first=p;
        (*first)->next=(*first)->prev=NULL;
        *last=*first;
    }
    else
    {
        q=*first;
        while(q)
        {
            if(p->key>q->key)
            {
                q=q->next;
            }
            else
            {
                if(q==(*first))
                {
                     p->prev=NULL;
                    (*first)->prev=p;
                    p->next=*first;
                    *first=p;
                    return;
                }
                q->prev->next=p;
                p->prev=q->prev;
                p->next=q;
                q->prev=p;
                return;
            }
        }
        (*last)->next=p;
        p->prev=*last;
        p->next=NULL;
    }
}

void afisareLista(node **first)
{
    node *p;
    printf("\nPretty printing \n");
    p=(*first);
    while(p)
    {
        printf("%d ",p->key);
        p=p->next;
    }
}

void interclasare()
{
    node *a,*b;
    if(m<n)
    {
        a=first1;
        while(a)
        {
            b=(node*)malloc(sizeof(node));
            b->key=a->key;
            adaugareNod(&first2,&last2,b);
            a=a->next;
        }
        printf("\nInterclasare\n");
        afisareLista(&first2);
    }
    else
    {
       b=first2;
        while(b)
        {
            a=(node*)malloc(sizeof(node));
            a->key=b->key;
            adaugareNod(&first1,&last1,a);
            b=b->next;
        }
        printf("\nInterclasare: \n");
        afisareLista(&first1);
    }
}

int main()
{
    int i;
    node *p,*q;
    printf("\nFirst list: ");
    fflush(stdin);
    scanf("%d",&m);
    first1=NULL;
    last1=NULL;
    for(i=0;i<m;i++)
    {
        p=(node*)malloc(sizeof(node));
        printf("\nKey: ");
        fflush(stdin);
        scanf("%d",&p->key);
        adaugareNod(&first1,&last1,p);
    }
    afisareLista(&first1);
    printf("\nSecond list: ");
    fflush(stdin);
    scanf("%d",&n);
    first2=NULL;
    last2=NULL;
    for(i=0;i<n;i++)
    {
        q=(node*)malloc(sizeof(node));
        printf("\nKey: ");
        fflush(stdin);
        scanf("%d",&q->key);
        adaugareNod(&first2,&last2,q);
    }
    afisareLista(&first2);
    interclasare();
    return 0;
}
