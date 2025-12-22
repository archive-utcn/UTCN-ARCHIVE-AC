#ifndef ARRAYS_H_INCLUDED
#define ARRAYS_H_INCLUDED

int numbers(int v[100])
{
    int i;
    if (v[i]-(int)v[i] == 0) // we check if the number read from the input is an integer
        return 1;
    else return 0;
}

/*int digit(char c){

    int value=0;

    switch(c){
         case 'I': value = 1; break;
         case 'V': value = 5; break;
         case 'X': value = 10; break;
         case 'L': value = 50; break;
         case 'C': value = 100; break;
         case 'D': value = 500; break;
         case 'M': value = 1000; break;
         case '\0': value = 0; break;
         default: value = -1;
    }

    return value;
}*/


#endif // ARRAYS_H_INCLUDED
