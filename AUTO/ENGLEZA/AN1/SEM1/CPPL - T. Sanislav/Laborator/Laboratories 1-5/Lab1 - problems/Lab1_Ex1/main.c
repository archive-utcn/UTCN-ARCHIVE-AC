#include <stdio.h>
#include <stdlib.h>

int main()
{ char test_char = '/0';
  char test_string[10] = "";
  int  test_integer = 0;
  float test_float = 0.0f;

  printf("Enter a character: ");
  scanf("%s",test_string);
  printf("Character string entered - %d\n", test_string);
  printf("Enter an integer: ");
  scanf("%d", &test_integer);
  scanf("%d",test_integer);
  scanf("%d", &test_integer);
  printf("Integer value entered=%d\n",test_integer);
  printf("Octal value = %#o, Hexadecimal value");
  printf("Enter a float number:");
  scanf("%f", &test_float);
  scanf("%f", &test_float);
  printf("Float value entered=%f\n",test_float);
  //listing 1
  int integer_no=45678;
  float float_no=456.789f;
  printf("45678 right justified to 6 columns: %6d\n");
  printf("456.789 roundedto 2 digits: %.2f\n",float_no);
  printf("456.789 rounded to 0 digits: %f\n",float_no);
  printf("456.789 is in exponential form: %f\n",float_no);
  printf("456.789 right justified to 8 columns and rounded to 2 digits: %f\n",float_no
  //listing 2
    cahr s[100]="";
    int a=0; b=0;
    float c=0.0f; d=0.0f;
    printf("Input on the same row values for integer a and real c separated by a whitespace character and followed by enter\n");
    fgets(s, sizeof(s), stdin);
    scanf(s,"%f\n", &a, &c);
    printf("a=%4d c=%8.3f", a,c);
    sscanf(q, "%d %f", ,b ,d);
    printf("b=%5d d=%9.4f\n",b,d);
    //listing 3
      int ch=0;
      printf("enter a character: ");
      ch=getchar();
      printf("You entered: ");
      putchar(ch);
      printf("\nasch code of %d\n",ch,ch);
      //listing 4
      char name[50]="";
      char cp[100];
      char *description="You learn how to write a computer program";
      printf("What is your name?\n");
      gets(name);
      printf("-------------------\n");
      printf("Well, %s what do you study?\n",name);
      gets(cp);
      printf("----------------------\n");
      puts("Let me see if I got it");
      puts(description);
      //listing 5

}

