#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
struct nod
{int val;
struct nod *urm;
};



int main()
{ struct nod *vf;
char s[100],*p,ch[]=", ";
int i,n=0,m=0;


citire:
    {
        printf("\nIntroduceti expresia, valori separate prin virgula (2,3,+): \nE=");
        gets(s);
        if(strlen(s)==0)
            {
                printf("\n\t Valoare eronata a expresiei");
                goto citire;
            }
        for (i=0;i<strlen(s);i++)
            {
                if (!isdigit(s[i])&&s[i]!=','&&s[i]!='+'&&s[i]!='-'&&s[i]!='/'&&s[i]!='*')
                    {
                        printf("\n\t Valoare eronata a expresiei");goto citire;
                    }

            }
    }

p=strtok(s,ch);
while (p)
    {
        if(isdigit(p[0]))
            {
                if(vf==NULL)
                    {
                        vf=malloc(sizeof(struct nod));
                        if(vf==NULL) {fprintf(stderr,"\n Eroare la alocare de memorie");exit(1);}
                        vf->urm=NULL;
                        vf->val=atoi(p);
                    }
                else
                    {
                        struct nod *q;
                        q=malloc(sizeof(struct nod));
                        if(q==NULL) {fprintf(stderr,"\n Eroare la alocare de memorie");exit(1);}
                        q->urm=vf;
                        q->val=atoi(p);
                        vf=q;
                    }
                n++;
            }
        else
            {
                m++;
                if (m>=n) {free(vf);printf("\n\tExpresie scrisa incorect");n=0;m=0;goto citire;}
                switch(p[0])
                    {
                        case '+' : vf->urm->val=vf->val+vf->urm->val;break;
                        case '-' : vf->urm->val=vf->urm->val-vf->val;break;
                        case '*' : vf->urm->val=vf->val*vf->urm->val;break;
                        case '/' : vf->urm->val=vf->urm->val/vf->val;break;
                    }
                struct nod *q;q=vf;vf=vf->urm;free(q);
            }

        p=strtok(NULL,ch);
    }

printf("\nE= %d",vf->val);
getchar();
getchar();
return 0;
}
