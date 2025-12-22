#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <ctype.h>

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


char *stritoa(int a)
{ 
  char *aux=(char*)malloc(6*sizeof(char));
  int i=0,s=0;
  aux[0]='\0';
  if (a<0)
     { a=-a;
       s=1;
     }
  if (a==0)
     strcat(aux,"0");
  while (a)
        { aux[i++]=(a%10)+48;
          aux[i]='\0';
          a/=10;
        }
  if (s)
     strcat(aux,"-");
  strrev(aux);
  return aux;
}

char *strftoa(long double a)
{ 
  char *aux=(char*)malloc(31*sizeof(char));
  int ai=(int)a,i=0,s;
  long double af=a-ai;
  strcpy(aux,stritoa(ai));
  strcat(aux,".");
  i=s=strlen(aux);
  while ( (af) && (i-s<6) )
        { aux[i++]=(af*10)+48;
          aux[i]='\0';
          af=af*10-(int)(af*10);
        }
  if (aux[strlen(aux)-1]=='.')
     strcat(aux,"000000");
  return aux;
}

int stratoi(char *s)
{ 
  int t=0,i=0,m=0;
  if (*s=='-')
     { i=1;
       m=1;
     }
  for (;i<strlen(s);i++)
      { if (isdigit(s[i]))
           t=t*10+(s[i]-48);
      }
  if (m)
     t=-t;
  return t;
}


float stratof(char *s)
{ 
  int ai=0,i,t;
  float af=0.000000000000;
  t=stripos(s,".");
  char *aux=(char*) malloc((t+1)*sizeof(char));
  strncpy(aux,s,t);
  aux[t]='\0';
  ai=stratoi(aux);
  for (i=strlen(s)-1;i>t;i--)
      { if (isdigit(s[i]))
           af=af/10+(float)(s[i]-48)/10;
      }
  return ai+af;
}


int main()
{ 
  char s[100];
  int l,err,z;
  float t,x;
  printf("\n Please input a number \n");
  scanf("%d",&z);
  strcpy(s,stritoa(z));
  printf("%s=%d\n",s,stratoi(s));
  printf("\n Please input a string\n");
  scanf("%f",&x);
  strcpy(s,strftoa(x));
  printf("%s=%f\n",s,stratof(s));
  getch();
}
