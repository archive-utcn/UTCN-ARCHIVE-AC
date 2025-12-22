// FISIERUL: lex.h
#include <stdio.h>
//#include <process.h>
#define     MAXINT 077777   /* cel mai mare intreg pozitiv */
#define     MAXUINT 0177777 /* cel mai mare intreg fara semn */
#define     NCPS 8          /* nr. caractere per simbol */
#define     DDISP 400       /* nr. intrari in tab. de dispersie */
#define     NCPC 2          /* nr. caractere per cuvint */
typedef struct tabdisp { char semd;       /* semafoare */
                        char nume[NCPS];  /* nume ASCII */
} TABDISP;
/* operatori */
#define EOFC      0                 
#define SEMI      1                 
#define LBRACE    2                 
#define RBRACE    3                 
#define LBRACK    4                 
#define RBRACK    5                 
#define LPARN     6                 
#define RPARN     7                 
#define COLON     8                 
#define COMMA     9                 
#define KEYW      19                
#define NAME      20                
#define CON       21                
#define STRING    22                
#define FCON      23                
#define LCON      25                
#define SIZEOF    91                
#define INCBEF    30                
#define DECBEF    31                
#define EXCLA     34                
#define COMPL     38                
#define DOT       39                
#define PLUS      40                
#define MINUS     41                
#define TIMES     42                
#define DIVIDE    43                
#define MOD       44                
#define RSHIFT    45                
#define LSHIFT    46
#define AND       47
#define OR        48
#define EXOR      49
#define ARROW     50
#define LOGAND    53
#define LOGOR     54
#define EQUAL     60
#define NEQUAL    61
#define LESSEQ    62
#define LESS      63

#define GREATEQ   64
#define GREAT     65
#define ASPLUS    70
#define ASMINUS   71
#define ASTIMES   72
#define ASDIV     73
#define ASMOD     74
#define ASRSH     75
#define ASLSH     76
#define ASSAND    77
#define ASOR      78
#define ASXOR     79
#define ASSIGN    80
#define QUEST     90
#define MAX       93
#define MIN       95
/*  tipuri */                  
#define INT       0                 
#define CHAR      1                 
#define FLOAT     2                 
#define DOUBLE    3                 
#define STRUCT    4
#define LONG      6
#define UNSIGN    7
#define UNION     8
/*  clase de memorie */              
#define TYPEDEF   9                 
#define AUTO      11                
#define EXTERN    12                
#define STATIC    13                
#define REG       13                
/*  cuvinte cheie */                 
#define GOTO      20                
#define RETURN    21                
#define IF        22                
#define WHILE     23                
#define ELSE      24                
#define SWITCH    25
#define CASE      26
#define BREAK     27
#define CONTIN    28
#define DO        29
#define DEFAULT   30
#define FOR       31
#define ENUM      32
/*  caractere */
#define BSLASH    117
#define SHARP     118
#define INSERT    119
#define PERIOD    120
#define SQUOTE    121
#define DQUOTE    122
#define LETTER    123
#define DIGIT     124

#define NEWLN     125
#define SPACE     126
#define UNKN      127
#define FKEYW     04
/* semafoare tabel de simboluri */
extern char tabc[], tamplex[], tampnum[], numefis[];
extern TABDISP tabdisp[], *lexc;
extern int lexascuns, cascuns, eof, linie, valc, nerori, disputil;
extern long valcl;

