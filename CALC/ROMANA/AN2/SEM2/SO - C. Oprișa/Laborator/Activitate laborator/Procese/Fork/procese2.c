#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <stdio.h>

int main(){
  pid_t sir[5];
  int c=0;
  while(c<5){
    sir[c]=fork();
    if(sir[c]==0){
       sleep(2);
       printf("%d %d \n  ",getpid(),getppid());
       sleep(2);
       exit(0);
    }
    else
     c++;
  }  
  
  do
    printf("Asteptam fii");
    while(wait(NULL)>0);

 return 0;




}
