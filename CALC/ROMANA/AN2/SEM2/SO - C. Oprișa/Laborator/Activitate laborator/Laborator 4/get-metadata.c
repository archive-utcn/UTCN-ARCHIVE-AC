#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>    
       
#define __DEBUG

#ifdef __DEBUG
void debug_info (const char *file, const char *function, const int line)
{
        fprintf(stderr, "DEBUG. ERROR PLACE: File=\"%s\", Function=\"%s\", Line=\"%d\"\n", file, function, line);
}

#define ERR_MSG(DBG_MSG) { \
        perror(DBG_MSG); \
        debug_info(__FILE__, __FUNCTION__, __LINE__); \
}

#else                   // with no __DEBUG just displays the error message

#define ERR_MSG(DBG_MSG) { \
        perror(DBG_MSG); \
}

#endif


#define MAX 1024                               
                               
/* String containing name the program is called with.  */
const char *program_name;

int main(int argc, char **argv)
{	
	program_name = argv[0];

	// Check the if command line parameters specified
	if (argc != 2) { // the expected parameter not specified
		fprintf(stderr, "Usage: %s <file_path>\n", argv[0]);
		exit(1);
	}
	
	struct stat fileMetadata;
	
	// Try geting info about the file
	if (stat(argv[1], &fileMetadata) < 0) {  // get info about a file system element (file, directory etc.)
		ERR_MSG("ERROR (getting info about the file)");
		exit(2);
	}
	
	// Displaying the info about the file systeme element
	printf("Information anout %s is:\n", argv[1]);
	
	// type
	printf("Type: ");
	if (S_ISREG(fileMetadata.st_mode))
		printf("\"FILE\"\n");		
	if (S_ISDIR(fileMetadata.st_mode))
		printf("\"DIRECTORY\"\n");		
	if (S_ISLNK(fileMetadata.st_mode))
		printf("\"SYMBOLIC LINK\"\n");		

	// owner
	printf("UID (owner ID): %d\n", fileMetadata.st_uid);	
	
	// permission rights
	printf("Permissions:");
	if (fileMetadata.st_mode & S_IRUSR)		// check owner's READ permission (S_IRUSR is the mask 0400)
		printf("r");
	else	
		printf("-");	
	
	if (fileMetadata.st_mode & S_IWUSR)		// check owner's WRITE permission (S_IWUSR is the mask 0200)
		printf("w");
	else	
		printf("-");	
	
	if (fileMetadata.st_mode & S_IXUSR)		// check owner's EXECUTION permission (S_IXUSR is the mask 0100)
		printf("x");
	else	
		printf("-");
		
	if (fileMetadata.st_mode & S_IRGRP)		// check group's READ permission (S_IRGRP is the mask 0040)
		printf("r");
	else	
		printf("-");	
	
	if (fileMetadata.st_mode & S_IWGRP)		// check group's WRITE permission (S_IWGRP is the mask 0020)
		printf("w");
	else	
		printf("-");	
	
	if (fileMetadata.st_mode & S_IXGRP)		// check group's EXECUTION permission (S_IXGRP is the mask 0010)
		printf("x");
	else	
		printf("-");
		
	if (fileMetadata.st_mode & S_IROTH)		// check others' READ permission (S_IROTH is the mask 0004)
		printf("r");
	else	
		printf("-");	
	
	if (fileMetadata.st_mode & S_IWOTH)		// check others' WRITE permission (S_IWOTH is the mask 0002)
		printf("w");
	else	
		printf("-");	
	
	if (fileMetadata.st_mode & S_IXOTH)		// check others' EXECUTION permission (S_IXOTH is the mask 0001)
		printf("x");
	else	
		printf("-");
	printf("\n");	
			
	// size in bytes
	printf("Size: %ld\n", (long int)fileMetadata.st_size);	
	
	return 0;
}

