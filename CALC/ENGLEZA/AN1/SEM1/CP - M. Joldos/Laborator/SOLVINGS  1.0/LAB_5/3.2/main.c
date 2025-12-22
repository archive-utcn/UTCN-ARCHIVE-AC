#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "eval.h"

int main()
{
    char bufferA[1024],bufferB[1024];
    char op;
    int len1=0,len2=0,pos1=0;
    int addedLen;
    int skippedLen;
    double opnd1,opnd2,val;

    //initialize bufferA
    memset(bufferA,'\0',sizeof(bufferA));
    //read expression
    printf("Input a valid postfix expression:\n");
    if(!fgets(bufferA,sizeof(bufferA),stdin))
    {
        fprintf(stderr,"Cannot read expression!");
        return 1;
    }
    //clean the whitespace and \n at the end of bufferA
    while(strlen(bufferA) && isspace(bufferA[strlen(bufferA)-1]))
        bufferA[strlen(bufferA)-1]='\0';

    for(; pos1<strlen(bufferA) && bufferA[pos1] && bufferA[pos1]!='\n' ;)
    {
        //loop while there are >1 operand
        memset(bufferB,'\0',sizeof(bufferB)); //clean aux area
        if(sscanf(&bufferA[pos1],"%lf%n",&opnd1,&len1))
        {
            while(isspace(bufferA[pos1+len1]) && pos1+len1<strlen(bufferA))
                len1++; //got first operand
            for(;pos1+len1<strlen(bufferA);)
            {
                if(sscanf(&bufferA[pos1+len1],"%lf%n",&opnd2,&len2))
                {
                    while(isspace(bufferA[pos1+len1+len2]) && pos1+len1+len2<strlen(bufferA))
                        len2++; //got second operand

                    if(sscanf(&bufferA[pos1+len1+len2],"%c",&op))
                    {
                        if (op == '+' || op == '-' || op =='*' || op == '/')
                        {
                            //evaluate the expression
                            val=eval(opnd1,opnd2,op);
                            len2++;
                            break;
                        }
                        else
                        {
                            //did not find a shortest expression
                            opnd1=opnd2;
                            // add skipped position to bufferB
                            strncat(bufferB,&bufferA[pos1],len1);
                            pos1+=len1; //skip 1st operand
                            len1=len2;

                        }
                    }
                    else
                    {
                        fprintf(stderr, "No operand found at position %d in buffer: %s\n",
                                pos1 + len1 + len2, bufferA);
                        return 1;
                    }
                }
                else
                {
                    printf("Value=%f\n", val);
                    return 0;
                }
            }

            //replace evaluated expression by its value
            skippedLen=strlen(bufferB);
            sprintf(&bufferB[skippedLen],"%f",val);
            addedLen=strlen(&bufferB[skippedLen]);

            //some tail expression might exist in bufferA
            //append it to the end of bufferB

            if(pos1+len1+len2 < strlen(bufferA))
            {
                strcat(bufferB,&bufferA[pos1+len1+len2]);
            }
            //////??????????????????
            if(strlen(bufferB)==addedLen)
            {
                //only one operand left in bufferA
                printf("Value=%f\n",val);
                return 0;
            }
             // replace the contents of bufferA with bufferB
            strcpy(bufferA, bufferB);
            // reset processing from the beginning of bufferA
            pos1 = skippedLen = len1 = len2 = 0;

        }
        else break;
    }

    return 0;
}
