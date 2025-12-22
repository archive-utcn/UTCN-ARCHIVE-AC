#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>


int main()
{
    int i,j,k=0;

    char a[25][25]=
     {
       {'M',NULL,NULL,NULL,'M',NULL,NULL,'O','O','O',NULL,NULL,'K',NULL,NULL,'K',NULL,NULL,'Y',NULL,NULL,NULL,'Y'},
       {'M','M',NULL,'M','M',NULL,NULL,'O',NULL,'O',NULL,NULL,'K',NULL,'K',NULL,NULL,NULL,NULL,'Y',NULL,'Y',NULL},
       {'M',NULL,'M',NULL,'M',NULL,NULL,'O',NULL,'O',NULL,NULL,'K','K',NULL,NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL},
       {'M',NULL,NULL,NULL,'M',NULL,NULL,'O',NULL,'O',NULL,NULL,'K',NULL,'K',NULL,NULL,NULL,NULL,NULL,'Y',NULL,NULL},
       {'M',NULL,NULL,NULL,'M',NULL,NULL,'O','O','O',NULL,NULL,'K',NULL,NULL,'K',NULL,NULL,NULL,NULL,'Y',NULL,NULL},
      };
  while(1<2){
    for(i=0;i<23;i++)
     for(j=0;j<23;j++)
     {
       if(k==0){
        if(j==0) printf("%c",a[i][j]);
        else printf("%c",a[i][j]);
        if(j==22) printf("\n");}
       else if(k==1){
        if(j==0) printf(" %c",a[i][j]);
        else printf("%c",a[i][j]);
        if(j==22) printf("\n");}
       else if(k==2){
        if(j==0) printf("  %c",a[i][j]);
        else printf("%c",a[i][j]);
        if(j==22) printf("\n");}
       else if(k==3){
        if(j==0) printf("   %c",a[i][j]);
        else printf("%c",a[i][j]);
        if(j==22) printf("\n");}
       else if(k==4){
        if(j==0) printf("    %c",a[i][j]);
        else printf("%c",a[i][j]);
        if(j==22) printf("\n");}
       else if(k==5){
        if(j==0) printf("     %c",a[i][j]);
        else printf("%c",a[i][j]);
        if(j==22) printf("\n");}
       if(i==22 && j==22)
        system("cls");


     } k++; if(k==6) k=0;
     };
    return 0;
}
