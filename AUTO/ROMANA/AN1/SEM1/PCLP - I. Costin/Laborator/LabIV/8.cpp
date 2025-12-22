#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<math.h>

int arab[7]={1000,500,100,50,10,5,1};
char roman[8]="MDCLXVI";

int valid(char x[25])//we make a function to test if a roman value is valid(is formed only from the letters MDCLXVI)
{ 
  int i;
  for(i=0;i<strlen(x);i++)
      { 
         if(!strchr(roman,x[i])) 
            return 0;//if we found a letter out from the set 'roman', than the roman value is not valid
      }
  return 1;
}

void convert_arab(char x[25],int&n)//transform the roman value in arab value
{ 
   int l=0,p,q,i,j,ok=0;
   i=0;
   n=0;
   while(x[i]=='M') 
     { 
       i=i+1; 
       l=l+1;
     }
   n=1000*l;
   for(j=i;j<strlen(x);)
     { 
        p=strchr(roman,x[j])-roman;
        if(j<strlen(x)-1) 
            q=strchr(roman,x[j+1])-roman;
        if(arab[p]<arab[q])
          {
             l=arab[q]-arab[p];
             n=n+l;
             j+=2;
          }
        else 
          { 
              n+=arab[p]; 
              j++;
          }
   }
}

int main()
{ 
  int n; 
  char x[25];  
  
  printf("\n Please input a roman value: \n");//we read the roman value
  scanf("%s",&x);
  
  if(valid(x))//we test if the roman value is a vaild one
    { 
      convert_arab(x,n); //we calculate the arab value
      printf("\n The arabian number is: \n ");//and we display it
      printf("\n %i ",n);
    }
  else 
      printf("\n Data input error ");//else, if the roman value is not valid, we display an error
  getch();
}
     
     
