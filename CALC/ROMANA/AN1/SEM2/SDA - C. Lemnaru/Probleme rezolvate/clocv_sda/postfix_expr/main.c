/*6. Se citeste de la tastatura o expresie postfixata corecta sintactic. Sa se scrie programul de evaluare a sa.
Expresia contine variabile formate dintr-o litera si operatorii binari +, -, *, /.   */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

typedef struct ignat{
    int pp;
    struct ignat *urm;
}L;
L *prim, *ultim;

void push(L **prim, L **ultim, L *p)
{

    ///face operatia de adaugare a nodului inaintea primului
    if(!(*prim))
    {
        ///lista este vida, deci noul nod va fi singurul inserat
        *prim=p;
        *ultim=p;
        p->urm=0;
    }
    else
    {
        ///cazul in care exista elemente in lista
        p->urm=(*prim);
        (*prim)=p;
    }


}

int pop(L **prim, L **ultim,int *a)
{
    ///realizeaza stergerea primului nod din lista
    L *p;
    if(!(*prim))///daca lista este vida
    {
        return 0;
    }
    else
    {
        p=*prim;
        *prim=(*prim)->urm;
        *a=p->pp;
        free(p);///eliberarea spatiului din memorie
        if(!(*prim))
        {

            *ultim=0;
        }
        return 1;

    }
}


int main()
{
    char *op;
    char sir[30];
    L *p;
    int nr;
    int a,b;


    printf("\nIntroduceti expresia postfixata, \ncu spatii intre operatori si operanzi: ");
    gets(sir);
    op=strtok(sir," ");///tokenizarea sirului
    while(op!=NULL)
    {
        if(!strcmp(op,"0"))
        {
            p=(L*)malloc(sizeof(L));
            p->pp=0;
            push(&prim,&ultim,p);
        }
        else
        {
            if(nr=atoi(op))
            {
                p=(L*)malloc(sizeof(L));
                p->pp=nr;
                push(&prim,&ultim,p);
            }
            else
            {
                if(strstr("+*/-",op)!=NULL)
                {
                    if(!pop(&prim,&ultim,&a))
                    {
                        printf("\nIncorect!! ");
                        return 0;
                    }
                    if(!pop(&prim,&ultim,&b))
                    {
                        printf("\nIncorect");
                        return 0;
                    }
                    p=(L*)malloc(sizeof(L));

                    switch(op[0])
                    {
                        case '+':
                            p->pp=a+b;
                            break;
                        case '*':
                            p->pp=a*b;
                            break;
                        case '/':
                            p->pp=a/b;
                            break;
                        case '-':
                            p->pp=a-b;
                            break;
                        default:
                            printf("\nE vina lui Domi ca nu merge !!!");
                            return 0;
                    }

                    push(&prim,&ultim,p);
                }
                else
                {
                    printf("\nTot vina lui Domi:P");
                    return 0;
                }
            }
        }
        op=strtok(NULL," ");
    }

    if(prim!=ultim)
    {
        printf("\nIncorect! ");
    }
    else
    {
        printf("\nRezultatul %d",prim->pp);
    }

    return 0;
}
