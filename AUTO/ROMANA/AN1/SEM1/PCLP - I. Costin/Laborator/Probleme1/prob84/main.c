/*Se citeste de la tastatura un text care se scrie într-un fisier "text.dat". Sa se afiseze apoi continutul
fisierului, fiecare linie fiind precedata de numarul de ordine al ei.*/

 #include <stdio.h>
 #include <conio.h>
 #include <io.h>
 #include <fcntl.h>
 #include <sys\stat.h>
 #include <process.h>
 #include <stdlib.h>
 #include <string.h>


int main()
{
    int df,j=0;
    char c, s[100];
    char nume_fis[]="D:\\C projects\\text.txt";
    df=creat(nume_fis,S_IREAD|S_IWRITE);

    do{ gets(s);
        write(df,s,strlen(s));
        printf("Adaugati o alta linie? D,d=DA\n");
        c=getch();
      }while(c=='d'||c=='D');
      close(df);

   df=open(nume_fis,O_RDONLY);
   while(read(df,s,strlen(s))>0)
   {

       j++;
       printf("%d \n", j);
       puts(s);
   }
   close(df);
   return 0;
}
