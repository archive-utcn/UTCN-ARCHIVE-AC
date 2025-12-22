#include <stdio.h>
#include <conio.h>
#include <io.h>
#include <fcntl.h>
#include <sys\stat.h>
#include <process.h>
#include <stdlib.h>
/* Low level file processing example */
typedef struct
{
char name[32];
float average;
/* other useful info */
} StudentT;
typedef union
{
StudentT stud;
char st[sizeof(StudentT)];
} BufferT;
typedef struct
{
int nb;
float avg;
} ElementT;
void sort( char filename[], char sorted_filename[] )
{
ElementT el,t[100];
int i, j, k, n, filedes1,filedes2;
BufferT stu;
j=0;
filedes1=open(filename,O_RDONLY);
while ( read( filedes1, stu.st, sizeof(StudentT)) >0 )
{
t[j].nb=j;
t[j].avg=stu.stud.average;
j=j+1;
}
/* Sort the array t on key avg (average) */
n=j-1;/* The elements of the table are 0,1,2,...,n */
j=0;
do
{
k=1; /* k=TRUE */
j=j+1;
for( i=0; i<=n-j; i++ )
{
if ( t[i].avg > t[i+1].avg )
{
el=t[i];
t[i]=t[i+1];
t[i+1]=el;
k=0; /*k=FALSE */
}
}
} while( k==0 );
close(filedes1);
/* Create the sorted file */
/* filedes2=creat(sorted_filename, S_IWRITE|S_IREAD); obsolete */
filedes2=open(sorted_filename, O_RDWR);
filedes1=open(filename, O_RDONLY);
for( i=0; i<=n; i++)
{
lseek( filedes1, (off_t)(t[i].nb * sizeof(StudentT)), SEEK_SET );
read(filedes1, stu.st, sizeof(StudentT) );
write(filedes2, stu.st, sizeof(StudentT) );
}
close(filedes1);
close(filedes2);
}
void show_records( char filename[])
{
BufferT stu;
int j, filedes1;
j=0;
filedes1=open(filename, O_RDONLY);
while ( read( filedes1, stu.st, sizeof(StudentT)) > 0 )
{
printf("\n%d %-32s %7.2f", j, stu.stud.name, stu.stud.average);
j=j+1;
}
close(filedes1);
}
int main()
{
int i, n, m, filedes1;
long l;
char ch;
BufferT stu;
char filename[50]="group.dat";
char sorted_filename[50]="grup_sorted.dat";
printf("\nNumber of students in the group, n=");
scanf("%d", &n);
/* create the group file */
if ((filedes1=open(filename, O_RDWR | O_CREAT)) < 0 )
{
printf("Cannot create file %s\n", filename);
exit(1);
}
/* Input student related data */
for( i=1; i<=n; i++ )
{
printf("\nStudent name: ");
scanf("%*c" );
gets(stu.stud.name);
printf("\nAverage=");
scanf("%f", &stu.stud.average);
write(filedes1, stu.st, sizeof(StudentT));
}
close(filedes1);
/* Append new articles */
printf("\nNumber of students to add, m=");
scanf("%d", &m);
filedes1=open(filename, O_RDWR);
lseek(filedes1,0l,2);
for( i=1; i<=m; i++)
{
printf("\nThe name of the student to append: ");
scanf("%*c");
gets(stu.stud.name);
printf("\nAverage=");
scanf("%f", &stu.stud.average);
write(filedes1, stu.st, sizeof(StudentT));
}
close(filedes1);
printf("\nThe content of the group file after creation is:\n");
show_records(filename);
/* Modification of file data */
printf("\nChange data [Yes=Y/y, No=other character]? ");
scanf("%*c%c", &ch);
filedes1=open(filename, O_RDWR);
while( ch=='Y' || ch=='y' )
{
printf("Student ordering number =");
scanf("%d%*c", &i);
l=lseek(filedes1, (off_t)(sizeof(StudentT) *i), SEEK_SET);
printf("Offset in file is=%ld for number, i=%d\n", l, i);
read( filedes1, stu.st, sizeof(StudentT) );
printf("\nOld name stored is:%s\n", stu.stud.name);
printf("\nNew name is:");
gets(stu.stud.name);
printf("\nOld average is: %f", stu.stud.average);
printf("\nNew average is: ");
scanf("%f", &stu.stud.average);
l=lseek( filedes1, (off_t)(sizeof(StudentT) *I ), SEEK_SET );
printf("Offset in file is=%ld for number, i=%d\n", l, i);
write( filedes1, stu.st, sizeof(StudentT) );
printf("\nMore changes [Yes=Y/y, No=other character]? ");
scanf("%*c%c",&ch);
}
close(filedes1);
printf("\nCON³INUTUL FISIERULUI NESORTAT\n");
afisare(filename);
getch();
printf("\nCON³INUTUL FISIERULUI SORTAT\n");
sortare(filename,sorted_filename);
show_records(sorted_filename);
system("Pause");
return 0;
}
