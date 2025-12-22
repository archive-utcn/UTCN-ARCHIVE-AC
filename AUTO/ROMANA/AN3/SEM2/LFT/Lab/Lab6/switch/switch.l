%option noyywrap
ALPHA [A-Za-z]
DIGIT [0-9]

%%
[\t \n]
switch  return SWITCH;
case return CASE;
break return BREAK;
default return DEFAULT;
{DIGIT}+    return NUM;
{ALPHA}({ALPHA}|{DIGIT})* return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
"||"    return OR;
"&&"    return AND;
.   return yytext[0];
%%