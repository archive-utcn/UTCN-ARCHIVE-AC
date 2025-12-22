#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>

int strpos(char *s, char *substr)
{ 
  int i=0,j,l=strlen(s)-strlen(substr);
  while (i<=l)
        { 
          for (j=0;( (j<strlen(substr)) && (s[j+i]==substr[j]));j++);
                 if (j==strlen(substr))
                     return i;
          i++;
        }
  return -1;
}

// returneaza >=0 pentru subsir gasit
// returneaza -1 pentru subsir inexistent


int stripos(char *s, char *substr)   // fara case sensitive
{ 
  char *S=(char*) malloc((strlen(s)+1)*sizeof(char));
  char *SUBSTR=(char*) malloc((strlen(substr)+1)*sizeof(char));
  strcpy(S,s);
  strcpy(SUBSTR,substr);
  S=strupr(S);
  SUBSTR=strupr(SUBSTR);
  return strpos(S,SUBSTR);
}
// returneaza >=0 pentru subsir gasit
// returneaza -1 pentru subsir inexistent


int main()
{ 
  char sir[100],s[100],s1[100];
  int t,T;
  printf("\n Please input a string\n");
  gets(s);
  printf("\nPlease input another string\n");
  gets(sir);
  strcpy(s1,sir);
  strupr(s1);
  t=strpos(s,sir);
  T=stripos(s,s1);
  if (t!=-1)
     printf("The string %s is in the string  %s on position %d (with sensitive case)\n",sir,s,t);
     else
         printf("\nThe string  %s does not exist in %s\n",sir,s);
  if (T!=-1)
     printf("The string %s is in %s on position %d (without sensitive case) \n",s1,s,T);
     else
         printf("\nThe string %s does not in %s\n",s1,s);
  getch();
}
