/*9. Sa se evalueze un arbore care contine în noduri constantele 0 si 1 si operatorii AND, OR, NOT.*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

typedef struct n{
    char c[5];
    struct n *stg,*dr;
}arb;

arb *rad;

arb *construireArbore()
{
    arb *p;
    char ch[5];
    fflush(stdin);
    scanf("%s",ch);
    if((strcmp(ch,"0")==0)||(strcmp(ch,"1")==0))///0 si 1 se pun in nodurile frunza
    {
        p=(arb*)malloc(sizeof(arb));
        strcpy(p->c,ch);
        p->stg=NULL;
        p->dr=NULL;
        return p;
    }
    else
    {
        p=(arb*)malloc(sizeof(arb));
        strcpy(p->c,ch);
        p->stg=construireArbore();
        p->dr=construireArbore();
        return p;
    }
}


void calcul(arb *p)
{
    int nrs,nrd;
    char ch[5];
    if(p->stg)
    {
        if((!strcmp(p->stg->c,"0"))||(!strcmp(p->stg->c,"1")))
        {
                if(!strcmp(p->c,"NOT"))
                {
                    nrs=atoi(p->stg->c);
                    nrs=(nrs+1)%2;
                    itoa(nrs,ch,2);
                    strcpy(p->c,ch);
                }
                else
                {
                    if(!strcmp(p->c,"AND"))
                    {
                        nrs=atoi(p->stg->c);
                        nrd=atoi(p->dr->c);
                        nrs=nrs*nrd;
                        itoa(nrs,ch,2);
                        strcpy(p->c,ch);
                    }
                    else
                    {
                        nrs=atoi(p->stg->c);
                        nrd=atoi(p->dr->c);
                        nrs=nrs+nrd;
                        itoa(nrs,ch,2);
                        strcpy(p->c,ch);
                    }
                    p->stg=p->dr=NULL;
                    calcul(p);
                }
        }
        else
        {
            calcul(p->stg);
            calcul(p->dr);
        }
        if(isdigit(p->c[0]))
        printf("Rezultat %s\n",p->c);
    }

}

int main()
{
    rad=construireArbore();
    calcul(rad);
    return 0;
}
