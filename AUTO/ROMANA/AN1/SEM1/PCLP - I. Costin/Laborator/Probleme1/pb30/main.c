//pb 30. De pe mediul de intrare se citeste o propozitie. Sa se indice numarul cuvintelor si cuvântul cel
//mai lung din propozitie.
#include<stdio.h>
#include<string.h>
main()
{char s[200],*p,sep[]=", .;:!*?",cuv[200];
int k=0,max=0;
gets(s);
p=strtok(s,sep);
while(p)
{ k++;
    if (strlen(p)>max)
       {max=strlen(p);
        strcpy(cuv,p);
       }
    p=strtok(NULL,sep);
}
printf("sunt %d cuvinte, iar cel mai lung cuvant este %s",k,cuv);

return 0;}
