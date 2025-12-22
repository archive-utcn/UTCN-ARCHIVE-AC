%{

#include<stdio.h>
int num, rest, bin=0, pos=1;
%}

DIGIT [0-9]

%%
{DIGIT}+ { num=atoi(yytext);
			while (num > 0)
			{
			rest= num % 2;
			bin+= rest*pos;
			pos*= 10;
			num/= 2;
			}
			printf("%d", bin);
			}
.|\n ECHO;
		
%%

int main()
{
	yylex();
	return 0;
}	
