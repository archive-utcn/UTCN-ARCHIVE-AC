%option noyywrap
alpha	[a-zA-Z]
digit	[0-9]
%%
[ \t\n]
select	return SELECT;
distinct	return DISTINCT;
from	return FROM;
where	return WHERE;
like	return LIKE;
desc	return DESC;
asc	return ASC;
"group by"	return GROUP;
having	return HAVING;
"order by"	return ORDER;
or	return OR;
and	return AND;
{digit}+	return NUM;
{alpha}({alpha}|{digit})*	return ID;
"<="	return LE;
">="	return GE;
"=="	return EQ;
"!="	return NE;
.	return yytext[0];
%%