////////////////////////
//
//3.3. Read the real part and imaginary part of n complex numbers. Then create a file containing
//the complex numbers your program read including the real part, the imaginary part, the
//modulus and argument for each number.
//
////////////////////////
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
typedef char sirc[100];
typedef struct num{
                   float real;
                   float img;
                   float mod;
                   float arg;
                  }nume[100];

void citire();
void scrie();

nume a;
int n=0;

int main()
{
    citire();
    scrie();
    getch();
}                     


void citire()
{
     float r,im;
     printf("The number of numbers=");
     scanf("%i",&n);
     for(int i=1;i<=n;i++){
                       printf("The real part=");scanf("%f",&r);
                       printf("The imaginary part=");scanf("%f",&im);
                       a[i].real=r;
                       a[i].img=im;
                       a[i].mod=sqrt(r*r+im*im);
                       a[i].arg=atan(im/r);
                      }
}

void scrie()
{
     FILE *f=fopen("numbers.txt","w");
     for(int i=1;i<=n;i++)
            fprintf(f,"%f\n%f\n%f\n%f\n",a[i].real,a[i].img,a[i].mod,a[i].arg);
     fclose(f);       
}
