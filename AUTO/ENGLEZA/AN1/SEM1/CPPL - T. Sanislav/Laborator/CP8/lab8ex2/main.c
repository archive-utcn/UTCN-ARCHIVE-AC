#include <stdio.h>
#include <stdlib.h>

int main()
{
    char file_name[50] = "file.txt", file1_name[50] = "file1.txt", file2_name[50] = "file2.txt";

    FILE *file_ptr;
    file_ptr = fopen(file_name, "r");      //a

    FILE *file1_ptr;
    file1_ptr = fopen(file1_name, "r");      //b

    FILE *file2_ptr;
    file2_ptr = fopen(file2_name, "w");      //c

    int account_num;
    char name[10];
    float current_balance, euro_amount;
    fscanf(file_ptr, "%d%s%f", &account_num, name, &current_balance);       //d

  fscanf(file1_ptr, "%d%f", &account_num, &euro_amount);      //e

 fprintf(file2_ptr, "%d%s%f", account_num, name, current_balance);     //f

fclose(file_ptr);

fclose(file1_ptr);

fclose(file2_ptr);
}



/*
FILE *file_ptr;
file_ptr = fopen("file.txt", r);

FILE *file1_ptr;
file_ptr = fopen("file1.txt", r);

FILE *file2_ptr;
file_ptr = fopen("file2.txt", w);

int account_num;
    char name[10];
    float current_balance, euro_amount;

fscanf(file_ptr, "%d%s%f",&account_num, name, &current_balance);
fscanf(file1_ptr, "%d%f",&account_num, &euro_amount);
fprintf(file1_ptr, "%d%s%f",account_num, name, current_balance);

fclose(file_ptr);

fclose(file1_ptr);

fclose(file2_ptr);

*/
