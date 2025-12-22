#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(int argc, char **argv)
{
	int childPid; 
		
	printf("[Parent] PID=%d ParentPID=%d\n", getpid(), getppid());
	
	// Create a new child	
	childPid = fork();
	
	// Check if successfully created the child
	if (childPid < 0) { // if not, terminate the parent too
		perror("Error creating new process");
		exit(1);
	}
		
	// Here we separare between the code executed by the parent and child
	if (childPid > 0) { //parent
		printf("[Parent] ChildPID=%d\n", childPid);
				
		waitpid(childPid, NULL, 0);
		
		printf("[Parent] Terminate the execution\n");
	} else {	    // child
		printf("[Child] PID=%d ParentPID=%d\n", getpid(), getppid());
		printf("[Child] Load and execute a new code. The actual one is overwritten and lost. There is no return from a successfull exec!!!\n");
		
		execlp("ls", "ls", "-l", NULL);
		
		// Putting code here makes sense only when execlp does not execute successfully
		perror("Error executing exec");
		printf("[Child] Terminate the execution\n");
		exit(1);
	}
	
}

