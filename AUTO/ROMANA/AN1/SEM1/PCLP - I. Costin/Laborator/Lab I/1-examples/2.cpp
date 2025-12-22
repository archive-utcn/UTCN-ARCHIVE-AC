#include <stdio.h>
#include <conio.h>
int main()
{
char s[200];
printf("\nPlease input a character string and press ENTER\n");
gets(s);
printf("\nThe character string is\n");
puts(s);
getch();
return 0;
}
