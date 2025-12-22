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
		
		sleep(1);	// delay the parent for a while
		system("ps -la");
		
		//waitpid(childPid, NULL, 0);
		
		printf("[Parent] Terminate the execution\n");
	} else {	    // child
		printf("[Child] PID=%d ParentPID=%d\n", getpid(), getppid());
		
		//sleep(1);
		//printf("[Child] PID=%d ParentPID=%d\n", getpid(), getppid());		
		
		printf("[Child] Terminate the execution\n");
	}
	
}

