#include <stdio.h>
#include <conio.h>
int main()
{
char s[100], q[100];
int a,b;
float c,d;
printf ("\nInput on the same row values for integer a and real c\n\
separated by a whitespecs character\n\
and followed by ENTER\n");
gets(s);
sscanf(s,"%d %f", &a, &c);
printf("\n a=%4d c=%8.3f\n", a, c);
sprintf(q,"%4d %8.3f\n", a, c);
sscanf(q,"%d %f",&b,&d);
printf("\n b=%5d d=%9.4f\n",b,d);
getch();
return 0;
}
