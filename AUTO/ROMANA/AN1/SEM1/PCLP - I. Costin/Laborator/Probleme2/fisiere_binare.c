#include <stdio.h>
#include <stdlib.h>
typedef struct
{
    int zi,luna,an;
} dat;
typedef struct
{
    char nume[30];
    char adresa[50];
    dat data;
} student;
FILE *f,*g;
void transformare1()
{
    student s;
    char aux[30],aux2[30];
   unsigned int n,i;
    printf("Numele fisierului text este : ");
    gets(aux);
    printf("Numele fisierului binar este : ");
    gets(aux2);
    f=fopen(aux,"r");
       if (f==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
    g=fopen(aux2,"wb");
     if (g==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
      fgets(s.nume,30,f);
        do
         {
             if (s.nume[strlen(s.nume)-1]=='\n')
             {
                 s.nume[strlen(s.nume)-1]=0;
             }
            fscanf(f,"%d.%d.%d\n",&(s.data.zi),&(s.data.luna),&(s.data.an));
             fgets(s.adresa,50,f);
              if (s.adresa[strlen(s.adresa)-1]=='\n')
             {
                 s.adresa[strlen(s.adresa)-1]=0;
             }
             fwrite(&s,sizeof(student),1,g);
         }
          while(fgets(s.nume,30,f)!=NULL);
         fclose(f);
         fclose(g);

}
void citire2()
{
    student s;
    char aux[30];
    unsigned int n,i;
    printf("Numele fisierului binar de intrare este : ");
    gets(aux);
     f=fopen(aux,"rb");
    if (f==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }

       while (fread(&s,sizeof(student),1,f)!=0)
       {

           printf("\n%s\n%d.%d.%d\n%s\n",s.nume,s.data.zi,s.data.luna,s.data.an,s.adresa);
       }
       fclose(f);

}
void copiere3()
{
     student s;
    char aux[30],aux2[30];
    printf("Numele fisierului binar sursa este : ");
    gets(aux);
    printf("Numele fisierului binar destinatie este : ");
    gets(aux2);
    f=fopen(aux,"rb");
       if (f==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
    g=fopen(aux2,"wb");
     if (g==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
        while (fread(&s,sizeof(student),1,f)!=0)
       {

           fwrite(&s,sizeof(student),1,g);
       }
       fclose(f);
       fclose(g);
}
void cautare4()
{
     student s;
    char aux[30],aux2[30];
    int ok;
    printf("Numele fisierului binar sursa este : ");
    gets(aux);
    ok=0;
    printf("Numele elevului : ");
    gets(aux2);
    f=fopen(aux,"rb");
       if (f==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
       while (fread(&s,sizeof(student),1,f)!=0)
       {

           if(strcmp(s.nume,aux2)==0)
           {
               printf("\n%s\n%d.%d.%d\n%s\n",s.nume,s.data.zi,s.data.luna,s.data.an,s.adresa);
               ok=1;
           }
       }
   if (ok==0) printf("\n\nElevul cautat nu exista !!!\n\n");
       fclose(f);
}
void citire5()
{
    student s;
    int i,n;
    char aux[30];
    printf("Numele fisierului binar de intrare este : ");
    gets(aux);
     f=fopen(aux,"rb");
    if (f==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
      i=1;
      fseek(f,-sizeof(student),SEEK_END);
       while (fread(&s,sizeof(student),1,f)!=0)
       {
     i++;
     fseek(f,-i*sizeof(student),SEEK_END);
           printf("\n%s\n%d.%d.%d\n%s\n",s.nume,s.data.zi,s.data.luna,s.data.an,s.adresa);
       }
       fclose(f);

}
void sortare6()
{
    student v[50],s;
    char aux[30],aux2[30];
    int n,i,ok=1;
    printf("Numele fisierului binar de intrare este : ");
    gets(aux);
     f=fopen(aux,"rb");
     i=0;
     printf("Numele fisierului binar destinatie este : ");
    gets(aux2);
    g=fopen(aux2,"wb");
       if (g==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }
    if (f==NULL)
       {
           perror("\nBig trouble Huston \n");
           exit(1);
       }

    while (fread(&v[i],sizeof(student),1,f)!=0)
       {
       i++;
        }
        n=i;
        while (ok==1)
        {
            ok=0;
              for (i=0;i<n-1;i++)
               if (sortare(v[i].data,v[i+1].data)==1)
              {
                  s=v[i];
                  v[i]=v[i+1];
                  v[i+1]=s;
                  ok=1;
              }
        }
        for (i=0;i<n;i++)
          fwrite(&v[i],sizeof(student),1,g);
          fclose(g);
       fclose(f);
}
int sortare(dat a,dat b)
{
    if (a.an>b.an) return 1;
      else
        if (a.an<b.an) return 2;
           else
               if (a.luna>b.luna) return 1;
                 else if (a.luna<b.luna) return 2;
                    else if (a.zi>b.zi) return 1;
                       else if (a.zi<b.zi) return 2;
                          else return 3;
}
void main()
{
    int op;
    char t;
    char r[2];
    op=0;
while (op!=7)
{
printf("\n\n1) Transformare fisier text in fisier binar\n2) Afisare fisier binar\n3) Copiere din fisier binar sursa in fisier binar destinatie\n4)Cautare nume elev in fisier\n5) Afisare continut fisier in ordine inversa\n6) Sortare dupa data nasterii\n7) Iesire ");
printf("\nOptiunea este : ");
scanf("%d",&op);
gets(r);
printf("\n\n");
switch (op)
{
    case 1:transformare1();break;
    case 2:citire2();break;
    case 3:copiere3();break;
    case 4:cautare4();break;
    case 5:citire5();break;
    case 6:sortare6();break;
    case 7:printf("\n\nApasa orice tasta pentru a iesi din program\n\n");getch(t);exit;break;
    default:printf("\n\nOptiunea nu exista!!\n");
}
}
}
