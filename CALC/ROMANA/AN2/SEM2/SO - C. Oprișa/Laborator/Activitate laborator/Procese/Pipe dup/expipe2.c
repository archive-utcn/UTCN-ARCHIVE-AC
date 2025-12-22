#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
  int fd[2];
  int pid;
  int suma;
  if (pipe(fd) <0)
    perror("Nu sa putut deschide pipe \n");

  if ((pid=fork())<0)
    perror("Nu sa putut face fork \n");

  if (pid==0) 
    {
       //primul fiu
       //redirectam iesirea standard
        dup2(fd[1],1);

       //inchidem pipe 
        close(fd[0]);
      
       //executam comanda who
       execlp("who","who",(char*)0);   
     }
   else 
      {
        pid=fork();
	if ((pid=fork())<0)
    	   perror("Nu sa putut face fork \n");
        
        if (pid==0 )
         {
           //al doilea fiu

           //redirectam intrarea standard 
           dup2(fd[0],0);
           
           //inchidem pipe
           close(fd[1]);
           
           //executam sort
           execlp("sort","sort",(char*)0);     
          } 
        else
          { 
             //procesul parinte
        
             close(fd[0]);
	     close(fd[1]); 
             
             wait(0);
             wait(0);   
          } 
     }
}
