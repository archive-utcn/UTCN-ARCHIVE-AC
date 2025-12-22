#include <stdio.h>
#include <stdlib.h>
#include<io.h>
#include<sys\stat.h>
#include<fcntl.h>
//citirea şi afişarea pe ecran a conţinutului unui fişier
void  citire_afisare()
{
        int n;
        char buf[20];
        int f=open("in.txt", O_RDONLY);
        if(f==-1)
                {
                    perror("Eroare");
                    exit(1);
            }
        while((n=read(f,buf,5))!=0)
              write(1,buf,n);
}//# copierea unui fişier sursă într-un fişier destinaţie (numele fişierelor se dă ca argument în linia de comandă)
void copiere(int argc, char *argv[])
{
        int n;
        char buf[20];
        int f=open(argv[1], O_RDONLY);
        int g=open(argv[2], O_WRONLY);
                if(f==-1)
                {
                    perror("Eroare");
                    exit(1);
            }
            if(g==-1)
                {
                    perror("Eroare");
                    exit(1);
            }
        while((n=read(f,buf,5))!=0)
              write(g,buf,n);
}
//# copierea unui fişier sursă într-un fişier destinaţie (numele fişierelor se introduce de la tastatură) astfel încât fiecare cuvânt să apară pe linie nouă
void copiere_tast()
{
         int n;
        char buf[20],in[20],out[20];
        printf("Introduceti numele fisierlui de intrare");
        gets(in);
        printf("Introduceti numele fisierlui de iesire");
        gets(out);
        int f=open(in, O_RDONLY);
        int g=open(out, O_WRONLY);
                if(f==-1)
                {
                    perror("Eroare");
                    exit(1);
            }
            if(g==-1)
                {
                    perror("Eroare");
                    exit(1);
            }
        while((n=read(f,buf,1))!=0)
             if(buf[n]!=' ')
                    write(g,buf,1);
                    else write(g,"\n",1);
}
int main(int argc, char *argv[])
{
    copiere(argc,argv);
    citire_afisare();
    copiere_tast();

}
