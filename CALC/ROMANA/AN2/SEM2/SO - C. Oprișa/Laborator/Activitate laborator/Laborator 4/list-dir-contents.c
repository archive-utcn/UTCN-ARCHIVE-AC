#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>

#include <stdio.h>
#include <stdlib.h>

#define MAX_PATH_LEN 256

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


void listDir(char *dirName)
{
	DIR* dir;
	struct dirent *dirEntry;
	struct stat inode;
	char name[MAX_PATH_LEN];

	dir = opendir(dirName);
	if (dir == 0) {
		ERR_MSG ("Error opening directory");
		exit(4);
	}

	// iterate the directory contents
	while ((dirEntry=readdir(dir)) != 0) {
		// build the complete path to the element in the directory
		snprintf(name, MAX_PATH_LEN, "%s/%s",dirName,dirEntry->d_name);
		
		// get info about the directory's element
		lstat (name, &inode);

		// test the type of the directory's element
		if (S_ISDIR(inode.st_mode))
			printf("dir ");
		else 
			if (S_ISREG(inode.st_mode))
				printf ("file ");
			else
				if (S_ISLNK(inode.st_mode))
					printf ("lnk ");
				else;

		printf(" %s\n", dirEntry->d_name);
	}

	closedir(dir);
}

int main(int argc, char **argv)
{
	if (argc != 2) {
		printf ("USAGE: %s dir_name\n", argv[0]);
		exit(1);
	}

	// Check if realy a directory
	struct stat fileMetadata;
	if (stat(argv[1], &fileMetadata) < 0) {  // get info 
		ERR_MSG("ERROR (getting info about the file)");
		exit(2);
	}
	
	if (S_ISDIR(fileMetadata.st_mode)) { // it is a directory
		// list directory's contents
		printf("The %s directory's contents is:\n", argv[1]);
		listDir(argv[1]);
	} else {
		printf("%s is not a directory!\n", argv[1]);
		exit(3);
	}
	
	return 0;
}
