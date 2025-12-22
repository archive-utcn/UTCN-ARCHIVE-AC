%option noyywrap
alpha	[a-zA-Z]
digit	[0-9]

%%
[\t \n]	;
int|float|void|char	return TYPE;
return	return RETURN;
{digit}+	return NUM;
{alpha}({alpha}|{digit})*	return ID;
.	return yytext[0];
%%