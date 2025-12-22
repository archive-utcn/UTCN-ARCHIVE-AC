#include <stdio.h>
#include <string.h>

  int main()
  {
        FILE *fptr1, *fptr2; //2 fisiere
        int lno, linectr = 0; //line num si liine control
        char str[50], fname[50];
        char newln[50], temp[] = "temp.txt";

		printf(" Input the filename: ");

        fgets(fname, 50, stdin);
        fname[strlen(fname) - 1] = '\0';

        fptr1 = fopen(fname, "r");
        fptr2 = fopen(temp, "w");

        printf(" Input the content of the new line : ");
        fgets(newln, 50, stdin);
        // get the line number to delete the specific line
        printf(" Input the line no you want to replace : ");
        scanf("%d", &lno);
        lno++;
         // copy all contents to the temporary file except the specific line
        while (!feof(fptr1))
        {
            strcpy(str, "\0");
            fgets(str, 50, fptr1);

            if (!feof(fptr1))
            {
                linectr++;

                if (linectr != lno)
                    {
                        fprintf(fptr2, "%s", str);
                    }
                    else
                    {
                        fprintf(fptr2, "%s", newln);
                    }
                }
        }
        fclose(fptr1);
        fclose(fptr2);

        remove(fname);
        rename(temp, fname);
        return 0;
  }
