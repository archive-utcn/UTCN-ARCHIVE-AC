#include<conio.h>
#include<stdio.h>
#include<stdlib.h>

/*  programul trebuie sa aleaga din N intrebari date un numar M de intrebari, A< M< B...astfel ca problema se reduce la realizarea
a N combinari luate cate M care se rezolva folosind tehnica bactracking

Chestionarele genrate vor fi afisate pe ecran
*/



typedef struct question
{
  char intrebare[1000];
  int punctaj;

}QUESTION;       //structura de date care va memora textul intrebarii si punctajul acesteia

QUESTION intrebari2[100];   //multimea de intrebari
int numar_de_intrebari;     //va retine numarul total de intrebari citite din fisier;

//---------------------------------Generare chestionare--------------------------------
void GenerareChestionar(int n,int dimensiune,int min,int max)   //functia ce va genera chestionare cu punctaj cuprins intre cele 2 valori date min si max
                                                                //dimensiune reprezinta numarul de intrebari care trebuie sa il aibe chestionarul
{                                                                // n retine numarul maxim de intrebari

  int combinatie[100];              // vector ce contine combinatia de numere generata de algoritm...
                                    // fiecare element din vectorul combinatie  reprezinta un indice catre un element din vectorul de intrebari

  int valid;                        //daca valid=1 solutia gasita este valida, in caz contrar este nevalida
  int i,j,k,nr_solutie=0;           //nr_solutie retine numarul solutiei la care s-a ajuns
  int punctaj_total=0;              // va retine punctajul total a fiecarui chestionar generat

  k=1;  combinatie[k]=0;

   //algoritm de bactraking
  while(k>0)
  {
     valid=0;
     while((valid==0)&&(combinatie[k]<=n-1))   //cat timp au ramas posibilitati netestate
     {

         combinatie[k]++;
         valid=1;
         i=1;
         while((valid==1)&&(i<=k-1))           // se testeaza validitatea solutiei generate pana in prezent
         {

            if(k==dimensiune)                 // daca chestionarul are nr de intrebari cerut se verifica daca punctajul total este cuprins in intervalul
            {
               punctaj_total=0;
               for(j=1;j<=k;j++)
               punctaj_total=punctaj_total+intrebari2[combinatie[j]].punctaj;       //calculeaza punctaj
               if((punctaj_total<min)||(punctaj_total>max)) valid=0;     // daca punctajul nu apartine intervalului specificat solutia devine invalida
            }

            if((combinatie[k]==combinatie[i])||(combinatie[i]>combinatie[k])) valid=0;// daca se repeta intrebari soutia devine invalida
            else i++;
          }
      }

        if(valid==0) k=k-1;// daca au fost incercate toate posibilitatile de la pasul k se trece la pasul anterior si se continua algoritmul cu elementele netestate
        else
        {
            if(k==dimensiune)   //daca chestionarul genrat are numar suficient de intrebari se tipareste
             {

                 nr_solutie++;
                 printf("\n solutie: %d",nr_solutie);
                 printf("\n-----------------------------------");

                 for(i=1;i<=dimensiune;i++)   //afisarea intrebarilor
                 printf("\n intrebarea %d: %s  punctaj %d",combinatie[i],intrebari2[combinatie[i]].intrebare,intrebari2[combinatie[i]].punctaj);
                 printf("\n puntaj total %d\n",punctaj_total);  //afisare punctaj total
                   getch();// dupa generarea tiparirea solutiei programul va astepta un raspuns de la utilizator pentru a continua cu calculrea si afisarea urmatoarei solutii
             }
            else   //daca chestinarul nu contine destule intrebari se mai adauga una
            {
                k++;
                combinatie[k]=0;
            }

        }



  }


}
//--------------------------------------------------------------------- citire din fisier------------------------------
void citire_din_fisier()
{

  FILE* pf;// descriptor fisier
  char c,d;
  char intrebare[1000],aux[1000];//siruri de caractere auxiliare
  int nr,i,j,k;

  pf=fopen("ceva.txt","r");//deschidere fisier pentru citire
  numar_de_intrebari=0;//initializeaza numarul de intrebari




do{


   i=-1;
   while((c=fgetc(pf))!='\n')   //citeste caractere pana se terminarea randului; pana la detectarea caracterului '\n' = new line sau ENTER
   {
      i++;            //retine numarul de caractere citite
      aux[i]=c;    //adauga caracterul la textul intrebarii
   }
   strncpy(intrebare,aux,i);  //copiaza din sirul auxiliar  in sirul de caractere intrebare
   intrebare[i]='?';
   intrebare[i+1]='\0';          //asa se face dupa ce se foloseste strncpy pentru a marca sfarsitul sirului de caractere intrebare

   fscanf(pf,"%d",&nr);    //citirea punctajului asociat intrebarii respective situat pe linia urmatoare

   numar_de_intrebari++;  //creste numarul de intrebari


   strcpy(intrebari2[numar_de_intrebari].intrebare,intrebare);// memoreaza textul intrebarii
   intrebari2[numar_de_intrebari].punctaj=nr;                 // memoreaza puntajul intrebarii
  // printf("\n intrebare= %s \n punctaj: %d",intrebari2[numar_de_intrebari].intrebare,intrebari2[numar_de_intrebari].punctaj);  //afisare intrebare


  }while((d=fgetc(pf))!=EOF);// verifica daca s-a ajuns la sfarsitul fisierului



}
//----------------------------------------------------------------------------Program Pincipal---------------------
int main()
{

int A,B,C,D;
int numar;
citire_din_fisier();// citire date din fisier
//-----------------------------citire de la tastarua a parametrilor pe care trebuie sa ii respecte chestionarul generat
printf("\n Fisierul de intrebari contine %d intrebari \n",numar_de_intrebari);
printf("\n Dati numarul minim de intrebari pe care sa-l contina chestionarul  A=");
scanf("%d",&A);
printf("\n Dati numarul maxim de intrebari pe care sa-l contina chestionarul  B=");
scanf("%d",&B);
printf("\n Dati numarul minim de puncte pe care trebuie sa il aibe chestionarul  C=");
scanf("%d",&C);
printf("\n Dati numarul minim de puncte pe care trebuie sa il aibe chestionarul  D=");
scanf("%d",&D);



//-----------------------genrerare solutii

for(numar=A;numar<=B;numar++)   // variaza dimensiunea chestionarelor intre valorile specificate
{                               //genereaza chestionare in fucntie de dimensiune
     printf("\n===================================\n");
     printf("\n Chestionar cu %d  intrebari\n",numar);
     GenerareChestionar(numar_de_intrebari,numar,C,D);
     printf("\n===================================\n");
}
    printf("\n S-au generat toate chestionarele posibile");

getch();
return 0;
    }
