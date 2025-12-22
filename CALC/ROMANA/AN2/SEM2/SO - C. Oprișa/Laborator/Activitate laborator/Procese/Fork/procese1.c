#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>

int main(){
	pid_t p,q,r;
  	p=fork();
  	if(p>0){
 	   q=fork();
           if(q>0){
              r=fork();
              if(r>0)
                wait(NULL);
              if(r==0){
                printf("sunt fiul cu pidul %d si tatal meu are pidul %d \n",getpid(),getppid());
                exit(0);
              }
              wait(NULL);
           }
           if(q==0){
              printf("sunt fiul cu pidul %d si tatal meu  are pidul %d \n",getpid(),getppid());   
              exit(0);
           }
           wait(NULL);
       }
       else if(p==0){
         printf("sunt fiul cu pidul %d si tatal meu are are pidul %d \n",getpid(),getppid());
         exit(0);
       }
       printf ("am creat 3 ");
       exit(0);
}
