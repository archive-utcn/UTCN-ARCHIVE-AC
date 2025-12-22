#include <stdio.h>
#include <stdlib.h>


typedef struct copil
{

char nume[20];
int key;
struct copil *urm,*prec;

}cop;

cop *pt,*p;
void adaugare()
{
    int n;
char s[20];
scanf("%d",&n);
for(i=1;i<=n;i++)
{
   p=(cop*)malloc(sizeof(cop));
   scanf("%s",&s) ;
   p->nume=s;
}
if (pt==0);
{
    pt=p;
    pt->urm=p;
    pt->prec=p;
}
else{

    p->urm=pt->urm;
    pt->urm=p;
    p->prec=pt;
    p->urm->prec=p;
}

}

void elim()
{
    int t=0;
    do
    {
        t++;
        if(t%2!=0)
        {
            for(i=1;i<=n;i++)
            {
                p=p->urm;
            }
            p->urm->prec=p->prec;
            p->prec->urm=p->urm;
        }
        else{
            for(i=1;i<=n;i++)
            {

                p=p->prec;
            }
p->urm->prec=p->prec;
p->prec->urm=p->urm;
        }
    }while(t<n)
        printf("%s",p->nume);
}

int main()
{
    adaugare();
    elim();
    return 0;


}





    }

}
}
}

}


}
int main()
{
    printf("Hello world!\n");
    return 0;
}
