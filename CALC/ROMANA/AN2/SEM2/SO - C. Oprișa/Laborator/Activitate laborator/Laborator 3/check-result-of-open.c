#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
       
#define __DEBUG

#ifdef __DEBUG 		// for debugging also displays the file, function and line in source code
			// where the error was found
void debug_info (const char *file, const char *function, const int line)
{
	fprintf(stderr, "DEBUG. ERROR PLACE: File=\"%s\", Function=\"%s\", Line=\"%d\"\n", file, function, line);
}

#define ERR_MSG(DBG_MSG) { \
        perror(DBG_MSG); \
	debug_info(__FILE__, __FUNCTION__, __LINE__); \
}

#else			// with no __DEBUG just displays the error message

#define ERR_MSG(DBG_MSG) { \
	perror(DBG_MSG); \
}

#endif


                               
/* String containing name the program is called with.  */
const char *program_name;

int main(int argc, char **argv)
{
	int fd;		// used to store a file descriptor

	program_name = argv[0];

	// Check the if command line parameters specified
	if (argc != 2) { // the expected parameter not specified
		fprintf(stderr, "Usage: %s <file_name>\n", argv[0]);
		exit(1);
	}
	
	// Try opening the file
	if ( (fd = open(argv[1], O_RDWR)) < 0) {
		ERR_MSG("ERROR (opening the file)");
		exit(2);
	}
	
	return 0;
}
