#include <stdio.h>
#include <conio.h>
#include <string.h>

const char *no_roman(int i_no)
{
 struct roman_digit_t  
      {
        char *m_ps_str;
        int m_i_value;
      };

 static const roman_digit_t roman_digits[]=
      {
    {"M",  1000},
    {"CM",  900},
    {"D",   500},
    {"CD",  400},
    {"C",   100},
    {"XC",   90},
    {"L",    50},
    {"XL",   40},
    {"X",    10},
    {"IX",    9},
    {"V",     5},
    {"IV",    4},
    {"I",     1},
      };
  
 static char s_roman_str[20];
 
 s_roman_str[0]='\0';
 for(int i=0;i_no&&i<sizeof(roman_digits)/sizeof(roman_digits[0]);i++)
       while(roman_digits[i].m_i_value<=i_no)
          {
            strcat(s_roman_str,roman_digits[i].m_ps_str);
            i_no-=roman_digits[i].m_i_value;
          }
  return s_roman_str;
}

int main ()
{
  int n;
  printf("\n Please input the number to be converted to roman :\n ");//we read the number
  scanf("%d", &n);
  printf("\n The conversion : %s\n",no_roman(n));//we display the converted number
  getch();
  return 0;
}
