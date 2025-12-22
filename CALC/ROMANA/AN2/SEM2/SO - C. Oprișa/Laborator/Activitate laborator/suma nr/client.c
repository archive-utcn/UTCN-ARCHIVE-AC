/**Programul va executa operatii de adunare si scadere pana la introducerea cuvantului "exit" .*/
/**
	Să se scrie două programe C, unul numit client.c, iar celălalt server.c. Programul client va afişa pe ecran un prompter şi va citi de la tastatură două numere întregi şi unul din caracterele ’+’ sau ’–’. Informaţiile cititevor fi transmise, cu ajutorul apelului sistem execl unui proces fiu care va executa codul serverului. Acesta va face opera ţia corespunzătoare şi va transmite rezultatul procesului păinte (client) cu ajutorul apelului sistem exit. Procesul client va afişa apoi rezultatulşi va reafişa prompterul pentru o nouă citire. 
*/

#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>

int main() 
{
	pid_t pid;
	char op1[4]="";
	char op2[4];
	char operator[2];

	int stare;
	while(strcmp(op1,"exit")!=0)
	{	
		printf("Introduceti operanzii sub forma: operand1 operand2 operator \n> ");
		scanf("%s",op1);
		if (strcmp(op1,"exit") == 0) continue;
		scanf("%s",op2);
		scanf("%s", operator);
	
		//printf("Stringul citit este: %s %s %s",op1, op2, operator);
		//exit(3);
		pid = fork();
		if (pid > 0)
		{
			wait(&stare);
			char t;
			t = WEXITSTATUS(stare);
			int x;
			printf("Rezultatul operatiei este %d.\n",t);//WEXITSTATUS(stare));
		}
		else if (pid == 0)
		{
			execl("./server","server",op1, op2, operator,NULL);
		}
		else
		{
			printf("Fork error\n");       			
			exit(1);
	  	}
	}
	exit(2);
}
