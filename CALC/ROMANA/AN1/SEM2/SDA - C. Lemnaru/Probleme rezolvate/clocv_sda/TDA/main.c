/*58. Sa se implementeze un TDA "numere mari". Un "numar mare" este un întreg care poate avea pâna la 200
de cifre. Pentru reprezentarea interna a numerelor se vor folosi siruri de caractere. Asupra acestor numere
se definesc operatiile aritmetice (adunare, scadere, înmultire).
Sa se scrie un program care citeste 2 numere si realizeaza operatiile aritmetice asupra lor.*/
#include <stdio.h>
#include <stdlib.h>
#include <mem.h>

int A[200],X[200];

void Atrib0(int H[])
{
    H[0] = 0;
}

void AtribValue(int H[], unsigned long X)
 {
    H[0] = 0;
    while (X)
    {
        ++H[0];
        H[H[0]] = X % 10;
        X /= 10;
    }
}

void AtribHuge(int H[], int X[])
{
    int i;
    for (i = 0; i <= X[0]; ++i)
    {
        H[i] = X[i];
    }
}

int Sgn(int H1[], int H2[])
{
    ///realizeaza compararea celor 2 nr mari si returneaza
    ///-1 pt H1<H2
    ///+1 pt H1>H2
    ///0 pt egalitate
    int i;
    // Elimina zero-urile semnificative, daca exista.
    while (H1[0] && !H1[H1[0]]) H1[0]--;
    while (H2[0] && !H2[H2[0]]) H2[0]--;
    if (H1[0] < H2[0])
    {
    return -1;
    }
    else if (H1[0] > H2[0])
    {
    return +1;
    }
    for ( i = H1[0]; i > 0; --i)
    {
    if (H1[i] < H2[i])
    {
    return -1;
    } else if (H1[i] > H2[i])
    {
    return +1;
    }
    }
    return 0;
}


void Add(int A[], int B[])

{
        ///realizeaza adunarea nr A si B, returneaza rezultatul prin A
        int i,T=0;
    if (B[0]>A[0])
    {
         for (i=A[0]+1;i<=B[0];)
          A[i++]=0;
            A[0]=B[0];
    }
    else for (i=B[0]+1;i<=A[0];)
    B[i++]=0;
    for (i=1;i<=A[0];i++)
    { A[i]+=B[i]+T;
    T=A[i]/10;
    A[i]%=10;
    }
    if (T) A[++A[0]]=T;
}

void Subtract(int A[],int B[])
{
        int i, T=0;
    for (i=B[0]+1;i<=A[0];)
    B[i++]=0;
    for (i=1;i<=A[0];i++)
    A[i]+= (T=(A[i]-=B[i]+T)<0) ? 10 : 0;
    /* Adica A[i]=A[i]-(B[i]+T);
    09.
    if (A[i]<0) T=1; else T=0;
    10.
    if (T) A[i]+=10; */
    while (!A[A[0]]) A[0]--;
}

void Shl(int H[], int Count)
/* H <- H*10^Count */
{
    ///realizeaza inmultirea lui H cu 10 la puterea Count
/* Shifteaza vectorul cu Count pozitii */
memmove(&H[Count+1],&H[1],sizeof(int)*H[0]);
/* Umple primele Count pozitii cu 0 */
memset(&H[1],0,sizeof(int)*Count);
/* Incrementeaza numarul de cifre */
H[0]+=Count;
}

void Shl2(int H[], int Count)
/* H <- H*10^Count */
{ int i;
/* Shifteaza vectorul cu Count pozitii */
for (i=H[0];i;i--) H[i+Count]=H[i];
/* Umple primele Count pozitii cu 0 */
for (i=1;i<=Count;) H[i++]=0;
/* Incrementeaza numarul de cifre */
H[0]+=Count;
}

void Shr(int H[], int Count)
/* H <- H/10^Count */
{
    ///imparte H prin 10 la puterea Count
/* Shifteaza vectorul cu Count pozitii */
memmove(&H[1],&H[Count+1],sizeof(int)*(H[0]-Count));
/* Decrementeaza numarul de cifre */
H[0]-=Count;

}

void Shr2(int H[], int Count)
/* H <- H/10^Count */
{ int i;
/* Shifteaza vectorul cu Count pozitii */
for (i=Count+1;i<=H[0];i++) H[i-Count]=H[i];
/* Decrementeaza numarul de cifre */
H[0]-=Count;
}


void Mult(int H[], unsigned long X)

{
    /// H <- H*X  inmultirea cu un scalar, adica un numar obisnuit
     int i;
    unsigned long T=0;
    for (i=1;i<=H[0];i++)
    {
        H[i]=H[i]*X+T;
        T=H[i]/10;
        H[i]=H[i]%10;
    }
    while (T) /* Cat timp exista transport */
    {
        H[++H[0]]=T%10;
        T/=10;
    }
}

void MultHuge(int A[],int B[],int C[])
{
    ///C <- A x B inmultirea a doau nr mari
     int i,j,T=0;
    C[0]=A[0]+B[0]-1;
    for (i=1;i<=A[0]+B[0];)
     C[i++]=0;
    for (i=1;i<=A[0];i++)
    for (j=1;j<=B[0];j++)
    C[i+j-1]+=A[i]*B[j];
    for (i=1;i<=C[0];i++)
    {
        T=(C[i]+=T)/10;
        C[i]%=10;
    }
    if (T) C[++C[0]]=T;
}

unsigned long Divide(int A[], unsigned long X)
{
    /// A <- A/X si intoarce A%X, adica impartirea unui nr mare la un scalar, return catul
     int i;
    unsigned long R=0;
    for (i=A[0];i;i--)
    {
        A[i]=(R=10*R+A[i])/X;
        R%=X;
    }
    while (!A[A[0]] && A[0]>1) A[0]--;
    return R;
}

void DivideHuge(int A[],int B[],int C[],int  R[])
{
    /// A/B = C rest R impartirea a doua nr mari
     int i;
    R[0]=0;C[0]=A[0];
    for (i=A[0];i;i--)
    {
         Shl(R,1);R[1]=A[i];
        C[i]=0;
    while (Sgn(B,R)!=1)
    {
         C[i]++;
        Subtract(R,B);
    }
    }
    while (!C[C[0]] && C[0]>1) C[0]--;
}


void ReadData(void)
    {
        FILE *F=fopen("input.txt","rt");
        int C,i;
        A[0]=0;
        do A[++A[0]]=(C=fgetc(F))-'0';
        while (C!=EOF);
        A[0]--;
        fclose(F);
        /* Intoarce vectorul pe dos */
        for (i=1;i<=A[0]/2;i++)
        {
            A[i]=(A[i]=A[A[0]+1-i]);
            (A[A[0]+1-i]=A[i]);
        }
    }

void WriteSolution(void)
{
    FILE *F=fopen("output.txt","wt");
    int i=X[0];
    while (!X[i]) i--;
    while (i) fputc(X[i--]+'0',F);
    fclose(F);
}



int main()
{


    return 0;
}
