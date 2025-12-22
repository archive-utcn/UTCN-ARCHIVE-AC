#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
       
#define __DEBUG

#ifdef __DEBUG          // for debugging also displays the file, function and line in source code
                        // where the error was found
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
	int fd;						// used to store a file descriptor
	char *msg="It is a beautiful day today!";	// data to be written into files
	char buf[MAX];					// used to store data read from files
	int bytesWritten; 				// used to store the return value of write
	int bytesRead; 					// used to store the return value of read
	long crtPosition;
	
	program_name = argv[0];

	// Check the if command line parameters specified
	if (argc != 2) { // the expected parameter not specified
		fprintf(stderr, "Usage: %s <file_name>\n", argv[0]);
		exit(1);
	}
	
	// Try opening the file
	printf("OPERATION: try creating a new file. A new file is empty and opened in \"W_ONLY | APPEND\" mode\n");
	if ( (fd = creat(argv[1], 0644)) < 0) {  // create a new file (or truncate an existing one)
						 // 0644 are the permission rights (rw-r--r--)
		ERR_MSG("ERROR (creating the file)");
		exit(2);
	}
	printf("RESULT   : file descriptor = %d\n\n", fd);
	
	// Try writing into the file
	printf("OPERATION: try writting a string of chars in the file starting from offset 0 (i.e. first byte in the file)\n");
	if ((bytesWritten = write(fd, msg, strlen(msg))) < 0) {
		ERR_MSG("ERROR (writing inside the file)");
		exit(3);
	}
	
	printf("RESULT   : No. of written bytes: %d, Bytes written: \"%s\"\n\n", bytesWritten, msg);
	
	
	// Try reading from the file
	// Which is the current position ? What is to be read? Which is the return value of read?
	printf("OPERATION: try reading from the current position in the file\n");
	crtPosition = lseek(fd, 0, SEEK_CUR);
	if ((bytesRead = read(fd, buf, 1)) < 0) {
		ERR_MSG("ERROR (reading from inside the file)");
		//exit(3);
	}
	printf("RESULT   : No. of read bytes: %d, from position: %ld\n\n", bytesRead, crtPosition);
	
	// Try writing into a bad file descriptor
	printf("OPERATION: try writting in a file using a bad file descriptor (i.e. one not returned by open)\n");
	if ((bytesWritten = write(fd+10, msg, 1)) < 0) {
		ERR_MSG("ERROR (writing to a bad file descriptor)");
		//exit(3);
	}
	printf("RESULT   : No. of written bytes: %d\n\n", bytesWritten);

	// Try writing into a read-only file
	printf("OPERATION: try writting into a file opened for READ_ONLY\n");
	close(fd);
	if ( (fd = open(argv[1], O_RDONLY)) < 0) {
		ERR_MSG("ERROR (opening the file)");
		exit(2);
	}
		 
	if ((bytesWritten = write(fd, msg, 1)) < 0) {
		ERR_MSG("ERROR (writing from a write-only file)");
		//exit(4);
	}
	printf("RESULT   : No. of written bytes: %d\n\n", bytesWritten);
			
	return 0;
}

