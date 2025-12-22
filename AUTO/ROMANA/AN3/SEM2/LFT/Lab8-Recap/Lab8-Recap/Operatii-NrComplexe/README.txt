Problem description

Write a Flex and Bison program to implement a complex number calculator. A complex number is of the form:

<code>a+bi</code>

where a and b are both real numbers and i is the imaginary unit. a and b are known respectively, as the real part of a complex number, and the imaginary part of a complex number. You need to implement the grammar for the addition, subtraction, multiplication and division operators. You also need to implement the grammar for the parenthesis ) operator that gives an operation (enclosed by it) the highest precedence. All the operators are left associative. The orders of precedence of the operators are listed below:

| Operators | Operations               | Associativity | Precedence |
| ----------|--------------------------|---------------|----------- |
| +, -      | Addition, subtraction    | Left          | Low        |
| *, /      | Multiplication, division | Left          | Medium     |
| ()        | Parenthesis              | NA            | High       |

We provide the definition for the structure complex to handle a complex number (in <i>complex_struct.h</i>). The structure has two parts, the real part (a) and the imaginary part (b). To access the real and the imaginary part of a complex typed variable when evaluating the grammar rules in Bison, you can simply use <i>$$.real</i>, <i>$$.img</i> or <i>$n.real</i>, <i>$n.img</i>, for n<sup>th</sup> token on the RHS of the Bison production rule (i.e. <i>$1.real</i>, and <i>$1.img</i> for the 1<sup>st</sup> token on the RHS). The functions for performing the complex addition, subtraction, multiplication and divisions are all provided to you in the Bison file (<i>complex_cal.y</i>). 

Read the comments in <i>complex_cal.y</i> for the details. All you need to do is to*:

1) set up the matching patterns for certain tokens in the Flex file (<i>complex.l</i>), pass the tokens and the values (correspond to the tokens) to Bison correctly. 

2) define the token names in the Bison file (<i>complex_cal.y</i>), and set up the grammar (set of production rules, and the corresponding actions) in the Bison file, so that the input complex number expression is properly parsed and evaluated according to the operators??associativities and precedence (The grammar for parsing and evaluating the complex expressions will be given below). The skeleton provided to you has already defined the token CNUMBER for a complex number returned from Flex. Feel free to define other tokens using names you like.

You program should assume a complex number always represented as a+bi (i.e. no need to consider the representation bi+a). Assume users will never enter a complex number with white spaces in the middle (if you want to remove the white spaces, you can used the RmWs() function we provided, but this is optional). The imaginary part of a complex number, b, can be zero but it is always supplied to the program (i.e. supplied as for real numbers). When b is 1, the complex part is represented as ??i but NOT i (i.e. 5+1i, but not 5+i). If the real part, a, is positive, there is no need to specify the sign explicitly (i.e. no need to write +a+bi), but when a is negative, the negative sign has to be added (i.e  a+bi). The sign for b is always specified explicitly. (i.e. a+bi or a-bi). For simplicity assume complex number is always enclosed by a pair of brackets (i.e. (a+bi) ). Do not put additional zeros to the front of a and b. For example when a=0.5 and b=1.9, do not represent the complex number as (00.5+01.9i) but instead represent it as (0.5+1.9i). Your program should assume all input numbers are complex numbers, a real number is input as a complex number with a zero imaginary part. For a better illustration, see the examples below. The grammars for defining a complex number (and parsing a complex expression) are also given below for your reference:
=====================
The BNF for unsign real:

```
<unsigned-real> ::= <integer-part><fraction>|<integer-part>

<integer-part> ::= <digit-sequence>

<fraction> ::= <dec-pt><digit-sequence>

<digit-sequence> ::= <digit>|<digit><digit-sequence>

<digit> ::= 0|1|2|3|4|5|6|7|8|9

<dec-pt> ::= .
```

The BNF for the complex number (that the program accepts): 

```
<complex-number> ::= <sign1><unsigned-real><sign2><unsigned-real><img>

<img> ::= i

<sign1> ::= <empty>|-

<sign2> ::= -|+
```

The BNF for parsing and evaluating the complex number expressions:

```
<complex-exp> ::= <complex-exp><PLUS><complex-exp-multi-div>|

                  <complex-exp><MINUS><complex-exp-multi-div>|

                  <complex-exp-multi-div>

<complex-exp-multi-div> ::= <complex-exp-multi-div><TIMES><complex-simple>|

                            <complex-exp-multi-div><DIV><complex-simple>|

                            <complex-simple>

<complex-simple> ::= <OPEN-BRACKET><complex-exp><CLOSE-BRACKET>| 

                     <OPEN-BRACKET><complex-number><CLOSE-BRACKET>

<PLUS> ::= +

<MINUS> ::= -

<TIMES> ::= *

<DIV> ::= /

<OPEN-BRACKET> ::= (

<CLOSE-BRACKET> ::= )

<complex-number> is a terminal (?œCNUMBER??passed by Flex to Bison).
```

=====================

A simple case:

```
> ./a.out

(5+6i)*(6+1i)

24.000000+41.000000i
```

A more complicated case:

```
> ./a.out

(7+8i)/(-3-4i)*(5+7i)

-11.720000-14.040000i
```

note that since the operators are left associative, the result of above is (-11.720000-14.040000i) instead of (-0.128108+0.211351i). 

Using the calculator for real numbers

```
> ./a.out

(5+0i)*(8+0i)

40.000000
```

A case involving all the 4 operators:

```
> ./a.out

(5-6i)+(-5+6i)-(7+8i)/(-3-4i)*(5+7i)

11.720000+14.040000i
```

A case involving a pair of parentheses:

```
> ./a.out

(7+8i)/((-3-4i)*(5+7i))

-0.128108+0.211351i
```

note that since multiplication is bracketed, the multiplication operation is made before the division operation, so the result becomes (-0.128108+0.211351i). 

A case involving some pairs of parentheses:

```
> ./a.out

((9+5i)+(8+9i)*(10+11i)/(10+11i))/((10+11i)+(10+11i)*(10-11i))

0.076306+0.056972i
```

A complicated case involving many pairs of parentheses:

```
> ./a.out

(((((9+5i)+(8+9i)*(10+11i)/(10+11i))/((10+11i)+(10+11i)*(10-11i))+((5+6i)*(7+8i)+(9+10i))+((9+5i)+(8+9i)*(10+11i)/(10+11i))))/((((9+5i)+(8+9i)*(10+11i)/(10+11i))/((10+11i)+(10+11i)*(10-11i))+((5+6i)*(7+8i)+(9+10i))+((9+5i)+(8+9i)*(10+11i)/(10+11i))))+((((9+5i)+(8+9i)*(10+11i)/(10+11i))/((10+11i)+(10+11i)*(10-11i))+((5+6i)*(7+8i)+(9+10i))+((9+5i)+(8+9i)*(10+11i)/(10+11i)))))

14.076306+106.056972i
```

A case with real numbers for the real and imaginary parts:

```
> ./a.out

((9.2+5.3i)+(8.9+9.1i)*(10.3+11.5i)/(10.1+11.55i))/((10.32+11.32i)+(10.1+11.55i)*(10.6-11.7i))

0.075544+0.052165i
```

A case that does not work because of the additional zeros in the front:

```
> ./a.out 

(00.00+06.00i)*(00.00+01.00i)

syntax error
```

Correction to the previous case to make it work:

```
> ./a.out 

(0.00+6.00i)*(0.00+1.00i)

-6.000000
```
