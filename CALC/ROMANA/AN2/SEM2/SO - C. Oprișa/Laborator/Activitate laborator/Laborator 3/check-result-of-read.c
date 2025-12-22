#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
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
	int fd;		// used to store a file descriptor
	char buf[MAX];	// used to store data read from files
	int bytesRead; 	// used to store the return value of read

	program_name = argv[0];


	// Check the if command line parameters specified
	if (argc != 2) { // the expected parameter not specified
		fprintf(stderr, "Usage: %s <file_name>\n", argv[0]);
		exit(1);
	}

	
	// Try opening the file
	if ( (fd = open(argv[1], O_RDONLY)) < 0) {
		ERR_MSG("ERROR (opening the file)");
		exit(2);
	}

	
	// Try reading from inside the file
	printf("OPERATION: try reading the first byte in the file\n");
	if ((bytesRead = read(fd, buf, 1)) < 0) {
		ERR_MSG("ERROR (reading from inside the file)");
		exit(3);
	}
	buf[bytesRead] = 0;
	printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\"\n\n", bytesRead, buf);

	
	// Try reading from the end of the file
	printf("OPERATION: try reading one byte after the end of the file\n");
	lseek(fd, 0, SEEK_END);
	if ((bytesRead = read(fd, buf, 1)) < 0) {
		ERR_MSG("ERROR (reading from inside the file)");
		exit(3);
	}
	buf[bytesRead] = 0;
	printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\"\n\n", bytesRead, buf);

	
	// Try reading from a bad file rescriptor
	printf("OPERATION: try reading from a file using a bad file descriptor (i.e. one not returned by open)\n");
	if ((bytesRead = read(fd+10, buf, 1)) < 0) {
		ERR_MSG("ERROR (reading from a bad file descriptor)");
		//exit(3);
	}
	printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\"\n\n", bytesRead, buf);


	// Try reading from a write-only file
	close(fd);
	printf("OPERATION: try reading from a file opened for WRITE_ONLY\n");
	if ( (fd = open(argv[1], O_WRONLY)) < 0) {
		ERR_MSG("ERROR (opening the file)");
		exit(2);
	}
		 
	if ((bytesRead = read(fd, buf, 1)) < 0) {
		ERR_MSG("ERROR (reading from a write-only file)");
		//exit(3);
	}
	buf[bytesRead] = 0;
	printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\"\n\n", bytesRead, buf);
	
	return 0;
}
