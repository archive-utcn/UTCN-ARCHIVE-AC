
//FISIERUL: lex.h
#include <stdio.h>
#include <process.h>
#define  MAXINT 077777        /* cel mai mare intreg pozitiv*/
#define  MAXUINT 0177777      /* cel mai mare intreg fara semn*/
#define  NCPS  8                                                                /* nr. caractere per simbol*/
#define  DDISP 400        /* nr. intrari in tab. de dispersie*/
#define  NCPC  2                                                                /* nr. caractere per cuvint*/
typedef struct tabdisp { char semd;        /* semafoare*/
			 char nume[NCPS];  /* nume ASCII*/
} TABDISP;
/* operatori*/
#define EOFC        0
#define SEMI        1
#define LSHIFT      46
#define LBRACE      2
#define AND         47
#define RBRACE      3
#define OR          48
#define LBRACK      4
#define EXOR        49
#define RBRACK      5
#define ARROW       50
#define LPARN       6
#define LOGAND      53
#define RPARN       7
#define LOGOR       54
#define COLON       8
#define EQUAL      60
#define COMMA       9
#define NEQUAL	61
#define KEYW        19
#define LESSEQ	62
#define NAME        20
#define LESS 	63
#define CON            21
#define GREATEQ	64
#define STRING      22
#define GREAT	65
#define FCON        23
#define ASPLUS	70
#define LCON        25
#define ASMINUS 71
#define SIZEOF      91
#define ASTIMES	72
#define INCBEF      30
#define ASDIV	73
#define DECBEF      31
#define ASMOD	74
#define EXCLA       34
#define ASRSH	75
#define COMPL       38
#define ASLSH	76
#define DOT            39
#define ASSAND	77
#define PLUS        40
#define ASOR	78
#define MINUS       41
#define ASXOR	79
#define TIMES       42
#define ASSIGN	80
#define DIVIDE      43
#define QUEST	90
#define MOD            44
#define MAX	93
#define RSHIFT      45
#define MIN	95
/*  tipuri*/
#define INT     0
#define STRUCT	4
#define CHAR    1
#define LONG	6
#define FLOAT   2
#define UNSIGN	7
#define DOUBLE  3
#define UNION	8

/*  clase de memorie si  caractere*/
#define TYPEDEF     9
#define BSLASH	117
#define AUTO        11
#define SHARP	118
#define EXTERN      12
#define INSERT	119
#define STATIC      13
#define PERIOD	120
#define REG            13
#define SQUOTE	121
/*  cuvinte cheie*/
#define DQUOTE	122
#define GOTO        20
#define LETTER	123
#define RETURN      21
#define DIGIT	124
#define IF              22
#define NEWLN	125
#define WHILE       23
#define SPACE	126
#define ELSE        24
#define UNKN	127
#define SWITCH      25
#define CASE        26
#define BREAK       27
#define CONTIN      28
#define DO             29
#define DEFAULT     30
#define FOR            31
#define ENUM        32
/* semafoare tabel de simboluri*/
#define FKEYW       04
extern char tabc[], tamplex[], tampnum[], numefis[];
extern TABDISP tabdisp[], *lexc;
extern int lexascuns, cascuns, eof, linie, valc, nerori, disputil;
extern long valcl;