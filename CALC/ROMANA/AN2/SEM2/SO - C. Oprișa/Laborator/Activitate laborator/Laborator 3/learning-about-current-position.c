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
	
	// CREATE THE FILE
	// Try opening the file
	printf("OPERATION: try creating a new file. A new file is empty and opened in \"W_ONLY | APPEND\" mode\n");
	if ( (fd = creat(argv[1], 0644)) < 0) {  // create a new file (or truncate an existing one)
						 // 0644 are the permission rights (rw-r--r--)
		ERR_MSG("ERROR (creating the file)");
		exit(2);
	}
	printf("RESULT   : file descriptor = %d\n\n", fd);		


	printf("OPERATION: close the file and try reopening it in \"O_RDWR\" mode\n");
	close(fd);
	
	// Reopen the file for RD-WR
	if ( (fd = open(argv[1], O_RDWR)) < 0) {
		ERR_MSG("ERROR (opening the file)");
		exit(2);
	}
	printf("RESULT   : file descriptor = %d\n\n", fd);
		 

	// Write into and read from the file 
	printf("OPERATION: try writing into and reading from the file byte by byte\n");
	printf("==================================================================\n");
	int i;
	for (i=0; i <= strlen(msg); i++) { 
		printf("----------- STEP %d ---------\n", i);
		printf("OPERATION: try writing one byte at current position\n");
		if ((bytesWritten = write(fd, &msg[i], 1)) < 0) {
			ERR_MSG("ERROR (writing into a the file)");
			//exit(4);
		}
		printf("RESULT   : No. of written bytes: %d, Byte writen: %c\n\n", bytesWritten, msg[i]);
		
		// Which is the current position ? What is to be read? Which is the return value of read?
		printf("OPERATION: getting the current position\n");
		crtPosition = lseek(fd, 0, SEEK_CUR);
		printf("RESULT   : crt. position: %ld\n\n", crtPosition);

		printf("OPERATION: try reading one byte from current position\n");
		if ((bytesRead = read(fd, buf, 1)) < 0) {
			ERR_MSG("ERROR (reading from inside the file)");
			exit(3);
		} 
		buf[bytesRead] = 0;
		printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\" from position: %ld\n\n", bytesRead, buf, crtPosition);
		
		// Now move back one position to realy read the previously written byte
		printf("OPERATION: change the current position, jump back one byte\n");
		crtPosition = lseek(fd, -1, SEEK_CUR);
		printf("RESULT   : crt. position: %ld\n\n", crtPosition);

		printf("OPERATION: try reading one byte from current position\n");
		if ((bytesRead = read(fd, buf, 1)) < 0) {
			ERR_MSG("ERROR (reading from inside the file)");
			exit(3);
		} 
		buf[bytesRead] = 0;
		printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\" from position: %ld\n\n", bytesRead, buf, crtPosition);
	}		
	printf("==================================================================\n");


	// TRY READ/WRITE FROM STRANGE POSITION IN THE FILE 
	// Jump over the end of file and try read and write from that position
	printf("\nOPERATION: Try reading from and writing to over the end of the file\n");
	crtPosition = lseek(fd, 0, SEEK_CUR);
	printf("RESULT   : The current position is: %ld\n", crtPosition);
	crtPosition = lseek(fd, 1024 * strlen(msg), SEEK_CUR);
	printf("RESULT   : The new current position is: %ld\n\n", crtPosition);

	printf("OPERATION: Try reading from after the end of the file\n");
	if ((bytesRead = read(fd, buf, 1)) < 0) {
		ERR_MSG("ERROR (reading from inside the file)");
		//exit(3);
	} else {
		buf[bytesRead] = 0;
		printf("RESULT   : No. of read bytes: %d, Bytes read: \"%s\" from position: %ld\n", bytesRead, buf, crtPosition);
	}


	printf("OPERATION: Try writing after the end of the file\n");
	if ((bytesWritten = write(fd, msg, strlen(msg))) < 0) {
		ERR_MSG("ERROR (writing from a write-only file)");
		//exit(4);
	}
	printf("RESULT   : No. of written bytes: %d\n", bytesWritten);	
		
	// Note the final size of the file. How can you explain it?
	printf("OPERATION: Get the file's size in bytes\n");
	struct stat info; 
	fstat(fd, &info);
	printf("RESULT   : The final size of the file is: %ld\n", info.st_size);
	
	return 0;
}

