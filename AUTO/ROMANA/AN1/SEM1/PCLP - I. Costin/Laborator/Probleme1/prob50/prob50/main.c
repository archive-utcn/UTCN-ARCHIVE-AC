/* 50. Sa se implementeze un editor de texte care sa permita câteva operatii
definite de Dvs. (inserarea unui text, stergere/ adaugare de caractere sau linii
etc). */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char *inserare(char s1[], char s2[], int incep)
{
    char *s;
    int i,k;
    s=(char*)calloc(strlen(s1)+strlen(s2)+1,sizeof(char));
    for(i=0;i<incep;i++)
    	{ *(s+i)=s1[i]; k++;}
    k=incep;
    for(i=0;i<strlen(s2);i++)
    	{ *(s+k)=s2[i]; k++;}
    for(i=incep;i<strlen(s1);i++)
        { *(s+k)=s1[i]; k++;}
    *(s+strlen(s)+1)='\0';
    return s;
}
char *extragere(char sir[], int incep, int lung)
{
    char *subsir,c;
    int i;
    subsir=(char*)calloc(lung+1,sizeof(char));
    if(incep<0)
      { for(i=0;i<strlen(sir)/2;i++)
                { c=*(sir+i);
                  *(sir+i)=*(sir+(strlen(sir)-i-1));
                  *(sir+(strlen(sir)-i)-1)=c;
                }
                printf("%s ",sir);
            incep=-incep;
        }
    for(i=0;i<lung;i++)
        *(subsir+i)=sir[incep+i-1];
    *(subsir+i)='\0';
    return subsir;
}
char *stergere(char sir[], int incep, int lung)
{
	char *sr;
	int i,j;
	sr=(char*)calloc(strlen(sir)-lung+1,sizeof(char));
	for(i=0;i<incep;i++)
		*(sr+i)=sir[i];
	for(j=incep+lung;j<strlen(sir);j++)
		{*(sr+i)=sir[j]; i++;}
	*(sr+i)='\0';
	return sr;
}
int main()
{
    char s[20],s1[20];
    int poz,ok,i,j,m,n;
    printf("\n Introduceti textul ");
    gets(s);
    printf("\n 1. Extragere ");
    printf("\n 2. Inserare ");
    printf("\n 3. Stergere\n");
    scanf("%d",&ok);
    if(ok==1)
 	  { printf("\n Introduceti pozitia de pe care se incepe extragerea");
    	scanf("%d",&i);
    	printf("\n Introduceti nr de caractere extrase");
    	scanf("%d",&j);
    	printf("\n Subsirul extras este %s ",extragere(s,i,j));
 	  }
	else if(ok==2)
      {
        printf("\n Introduceti sirul pe care doriti sa-l inserati");
    	gets(s1);//trebe citit un caracter ca sa se goleasca bufferul de la tastatura.
    	gets(s1);//trebe citit a doua oara ca sa obtinem informatia dorita
		printf("\n Introduceti pozitia de la care incepe inserarea");
    	scanf("%d",&poz);
    	printf("\n In urma inserarii => %s",inserare(s,s1,poz));
      }
	else if(ok==3)
	  { printf("\n Introduceti pozitia de la care incepe stergerea");
	    gets(s1);   //trebe citit un caracter ca sa se goleasca bufferul de la tastatura. altfel error
	    scanf("%d",&m);
	    printf("\n Introduceti numarul de caractere sterse");
	    scanf("%d",&n);
	    printf("\n In urma stergerii => %s",stergere(s,m,n));
	  }
}
