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
	int fd;						// used to store a file descriptor
	int bytesWritten; 				// used to store the return value of write
	int bytesRead; 					// used to store the return value of read
	int value;
	long crtPosition;
	
	program_name = argv[0];

	// Check the if command line parameters specified
	if (argc != 2) { // the expected parameter not specified
		fprintf(stderr, "Usage: %s <file_name>\n", argv[0]);
		exit(1);
	}
	
	// Try opening the file
	if ( (fd = creat(argv[1], 0644)) < 0) {  // create a new file (or truncate an existing one)
						 // 0644 are the permission rights (rw-r--r--)
		ERR_MSG("ERROR (creating the file)");
		exit(2);
	}
	
	close(fd);
	
	if ( (fd = open(argv[1], O_RDWR)) < 0) {
		ERR_MSG("ERROR (opening the file)");
		exit(2);
	}
	
	// WRITE two integers into the file
	printf("WRITE two integers into the file\n");
	// write an integer into the file
	value = 100;
	bytesWritten = write (fd, &value, sizeof(value));
	if (bytesWritten < 0) {
		ERR_MSG("ERROR (writing into the file)");
		exit(3);	
	}
	
	// write another integer after the previous one
	value = 200;
	bytesWritten = write (fd, &value, sizeof(value));
	if (bytesWritten < 0) {
		ERR_MSG("ERROR (writing into the file)");
		exit(3);	
	}
	
	// CORRECTLY read from the file: we must know exactly what and where there has been previously written
	printf("\nCORRECTLY read from the file: we must know exactly what and where there has been previously written\n");
	
	crtPosition = lseek(fd, 0 * sizeof(int), SEEK_SET);  // position where the FIRST integer was written
	if (crtPosition < 0) {
		ERR_MSG("ERROR (positioning into the file)");
		exit(4);	
	}
	
	bytesRead = read (fd, &value, sizeof(value));
	if (bytesRead < 0) {
		ERR_MSG("ERROR (reading from the file)");
		exit(5);	
	}
	printf("The first integer from the file is: %d\n", value);

	crtPosition = lseek(fd, 1 * sizeof(int), SEEK_SET);  // position where the SECOND integer was written
	if (crtPosition < 0) {
		ERR_MSG("ERROR (positioning into the file)");
		exit(4);	
	}
	
	bytesRead = read (fd, &value, sizeof(value));
	if (bytesRead < 0) {
		ERR_MSG("ERROR (reading from the file)");
		exit(5);	
	}
	printf("The second integer from the file is: %d\n", value);

	// INCORRECTLY read from the file: we must know exactly what and where there has been previously written
	printf("\nINCORRECTLY read from the file: position to wrong positions into the file\n");
	crtPosition = lseek(fd, 0 * sizeof(int) + 1, SEEK_SET);  // position to a non multiple of sizeof(int)
	if (crtPosition < 0) {
		ERR_MSG("ERROR (positioning into the file)");
		exit(4);	
	}
	
	bytesRead = read (fd, &value, sizeof(value));
	if (bytesRead < 0) {
		ERR_MSG("ERROR (reading from the file)");
		exit(5);	
	}
	printf("The first integer from the file is: %d\n", value);

	crtPosition = lseek(fd, 1 * sizeof(int) - 1, SEEK_SET);  // position again to non multiple of sizeof(int)
	if (crtPosition < 0) {
		ERR_MSG("ERROR (positioning into the file)");
		exit(4);	
	}
	
	bytesRead = read (fd, &value, sizeof(value));
	if (bytesRead < 0) {
		ERR_MSG("ERROR (reading from the file)");
		exit(5);	
	}
	printf("The second integer from the file is: %d\n", value);

	return 0;
}
