//zilele saptamanii
#include<stdio.h>
void main(void)
{char *zile[]={"Luni","Marti","Miercuri","Joi","Vineri","Sambata","Duminica"};
int i;
for(i=0;i<7;i++)
printf("zile[%d]=%-10s;zile[%d]=%p\n",i,zile[i],i,zile[i]);
for (i=0;i<7;i++)
printf("zile[5]++)=%c\n",*(zile[5]++));}
