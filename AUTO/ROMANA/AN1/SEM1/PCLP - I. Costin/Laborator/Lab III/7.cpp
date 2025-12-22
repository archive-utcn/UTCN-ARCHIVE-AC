#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

int poww(int n, int p)//we make a function which calculate n**p(a at power p)
{
    int i;
    int put;
    put=1;
    for (i=0;i<p;i++)
    {
        put=put*n;
    }
 return put;   
}

int main()//principal program
{
    char x[20];
    int i,n,lung;
    printf("\nPlease input the number of digits: \n)");
    scanf("%d",&lung);
    printf("\n Please input the number \n");//we read the number
    scanf("%s",&x);
    n=0;//represent the number in which we want to calculate the decimal representation of the number x
    for (i=0;i<lung;i++)
        {
         switch(x[i])
                     {
                      case 'a':n=n+10*poww(16,lung-1-i);break;
                      case 'b':n=n+11*poww(16,lung-1-i);break;
                      case 'c':n=n+12*poww(16,lung-1-i);break;
                      case 'd':n=n+13*poww(16,lung-1-i);break;
                      case 'e':n=n+14*poww(16,lung-1-i);break;
                      case 'f':n=n+15*poww(16,lung-1-i);break;     
                      case '1':n=n+1*poww(16,lung-1-i);break;    
                      case '2':n=n+2*poww(16,lung-1-i);break;   
                      case '3':n=n+3*poww(16,lung-1-i);break;    
                      case '4':n=n+4*poww(16,lung-1-i);break;    
                      case '5':n=n+5*poww(16,lung-1-i);break;    
                      case '6':n=n+6*poww(16,lung-1-i);break;    
                      case '7':n=n+7*poww(16,lung-1-i);break;    
                      case '8':n=n+8*poww(16,lung-1-i);break;   
                      case '9':n=n+9*poww(16,lung-1-i);break;  
                      default:break;  
                      }
         }
    printf("%d",n);//we display the number n                               
    getch();
}
