#include <stdio.h>

typedef struct
{
    char name[40];
    int salary;
} Record;

void create_file(const int, const char*);
void show_file(const char*);

int main()
{
    char file_name[40] = "file.bin";
    int n = 0;

    printf("Input the number of persons: ");
    scanf("%d", &n);

    create_file(n, file_name);
    printf("\nFile content:\n");
    show_file(file_name);



    return 0;
}

void create_file(const int n, const char *filename)
{
    FILE *fp;
    Record rec;
    int i = 0;

    fp = fopen(filename, "wb");
    if(fp == NULL)
    {
        printf("Error!");
        exit(1);
    }

    for(i = 1; i <= n; i++)
    {
        fflush(stdin);
        printf("First and last name of the person: ");
        fgets(rec.name, sizeof(rec.name), stdin);
        printf("Salary: ");
        scanf("%d", &rec.salary);
        fwrite(&rec, sizeof(Record), 1, fp);
    }
    fclose(fp);
}

void show_file(const char *filename)
{
    FILE *fp;
    Record rec;
    int i = 1;

    fp = fopen(filename, "rb");
    if(fp == NULL)
    {
        printf("Error!");
        exit(1);
    }

    printf("\nNO.\t SALARY \t FIRST AND LAST NAME\n");
    while(fread(&rec, sizeof(Record), 1, fp) > 0)
    {
        printf("%d \t %d \t \t %s", i, rec.salary, rec.name);
        i++;
    }
    fclose(fp);
}
