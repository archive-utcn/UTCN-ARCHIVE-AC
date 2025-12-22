#include<conio.h>
#include<stdio.h>
#include<string.h>

int position(char s[100],char a[100])
{
    int t,n,m,i,j;
    t=-1;//we assume that the second string is not a substring of the first string
    n=strlen(s);//the length of the first string
    m=strlen(a);//the length of the second string
    for (i=1;i<=n-m+1;i++)
        {
           j=1;
           if (s[i+j-1]==a[j])
              {
                do 
                  j=j+1;
                while((a[j]==s[j+i-1])and(j<m)); 
                if(j==m) 
                   t=i; 
              } 
        }
    return t;
}

int main()
{
    char s1[100],s2[100];
    printf("\n Please input the greater string : \n");//we read the forst string
    scanf("%s",s1);
    printf("\n Please input the smaller string : \n");//we read the second string
    scanf("%s",s2);
    printf("The position is %d ",position(s1,s2));//we display the position or -1 if the second string is not a substring of the first string
    getch();
    }
