#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>

int main(int argc, char **argv)
{
	int var;
	int childPid; 
	
	var = 10;
	
	printf("[Parent] var = %d\n", var);
	
	printf("[Parent] I am the only process up to here. I will create a new process.\n");
	
	childPid = fork();

	// Check if successfully created the child
	if (childPid < 0) { // if not, terminate the parent too	
		perror("Error creating new process");
		exit(1);
	}
	
	printf("[---] Message1. This message is displayed by both parent and child\n");
	
	// Here we separare between the code executed by the parent and child
	if (childPid > 0) { //parent
		printf("[Parent] The pid of my child (value returned by fork) is: %d\n", childPid);
		printf("[Parent] My own pid is: %d\n", getpid());
		
		// Each process has its own var
		var = 11; 
		printf("[Parent] Before child ends: var = %d\n", var);
		
		// wait for the child to terminate
		waitpid(childPid, NULL, 0);
		
		// Display again the var to see it is not changed by child
		printf("[Parent] After child ends: var = %d\n", var);
		
	} else {	    // child
		printf("[Child] The value returned by fork is: %d\n", childPid);
		printf("[Child] My own pid is: %d\n", getpid());
		printf("[Child] The pid of my parent is: %d\n", getppid());  // here we call getPpid() !!!
	
		// Each process has its own var
		var = 12; 
		printf("[Child] var = %d\n", var);
	}
	
	// Here parent and child meet again
	printf("[---] Message2.  This message is displayed by both parent and child\n");
}

