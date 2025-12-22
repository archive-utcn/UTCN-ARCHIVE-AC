/* lex file: float0.l  */
%%
[+-]?[0-9]*(\.)?[0-9]+    {printf("FLOAT");}
%%
int main()
{
 yylex();
 return 0;
}
