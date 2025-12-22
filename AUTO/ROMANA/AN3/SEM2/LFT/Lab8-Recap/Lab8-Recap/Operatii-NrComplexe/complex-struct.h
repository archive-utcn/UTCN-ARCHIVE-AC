#include <string.h>

/* struct for holding a complex number */
typedef struct {
  double real;
  double img;
} complex;

/* define the return type of FLEX */
#define YYSTYPE complex
