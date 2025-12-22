#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

#include <stdio.h>
#include <stdlib.h>

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


#define BUFSIZE 512

int main (int argc, char** argv)
{
	int from, to, nr, nw;
	char buf[BUFSIZE];
	
	if (argc != 3) {
		printf("USAGE: %s source_file dest_file\n", argv[0]);
		exit(1);
	}

	if ((from = open(argv[1], O_RDONLY)) < 0) {
		ERR_MSG("Error opening the source file");
		exit(2);
	}
	
	if ((to = creat(argv[2], 0666)) < 0) {
		ERR_MSG("Error creating the destination file");
		exit(3);
	}

	while((nr = read(from, buf, sizeof(buf))) != 0) {
		if (nr < 0) {
			ERR_MSG("Error reading from the source file");
			exit(4);
		}

		if ((nw=write(to, &buf, nr)) < 0) {
			ERR_MSG("Error writing in destination file");
			exit(5);
		}
	}
	
	close(from);
	close(to);
	
	return 0;
}
