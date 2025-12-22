#include <stdio.h>

typedef struct
{
    char name[40];
    int grade;
} Record;

void create_file(const int, const char*);
void show_file(const char*);
void getAverage();

int main()
{
    char file_name[40] = "file.bin";
    int n = 0, option = 0;

    printf("Input the number of persons: ");
    scanf("%d", &n);

    create_file(n, file_name);
    printf("\nFile content:\n");
    show_file(file_name);

    printf("\nStatistics\n");
    printf("\n1. Avarege");
    printf("\n2. MAX Grade");
    printf("\n3. MIN Grade\n");

    printf("\nEnter the no. of the wanted option: ");
    scanf("%d", &option);

    if(option == 1)
        getAverage(file_name);

    return 0;
}

void getAverage(const int n, const char *filename)
{
    int sum = 0, average;
    Record rec;

    for(int i = 0; i < n; i++)
    {
        sum += rec.grade;
    }

    average = sum/n;
    printf("\nThe average is: %d", average);

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
        printf("Grade: ");
        scanf("%d", &rec.grade);
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

    printf("\nNO.\t GRADE \t\t FIRST AND LAST NAME \n\n");
    while(fread(&rec, sizeof(Record), 1, fp) > 0)
    {
        printf("%d \t %d \t \t %s", i, rec.grade, rec.name);
        i++;
    }
    fclose(fp);

}
