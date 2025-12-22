/* Program 3.7 */

#include <stdio.h>
#include <stdlib.h>

#define MAX_DIM 50

int board[MAX_DIM][MAX_DIM],n;

/* A utility function to print solution */
void printSolution(int board[MAX_DIM][MAX_DIM])
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
            printf(" %d ", board[i][j]);
        printf("\n");
    }
}


int isSafe(int board[MAX_DIM][MAX_DIM], int row, int col)
{
    int i,j;

    //check the row on the left side
    for(i = 0; i < col; i++)
        if(board[row][i])
        return 0;

    //check the upper diagonal on the left side
    for(i = row, j=col; ( i >= 0 && j >= 0); i--, j--)
        if(board[i][j])
        return 0;

    //check the lower diagonal on the left side
    for(i = row, j = col; (i < n && j >= 0) ; i++, j--)
        if(board[i][j])
        return 0;

    return 1;
}

int solve(int board[MAX_DIM][MAX_DIM], int col)
{
    int i,j;

    // if all queens are placed , return true
    if(col >= n)
        return 1;
    // we try to position the queen on every available row
    for(i = 0; i < n; i++)
    {
        if(isSafe(board,i,col))
        {
            board[i][col]=1;
            if(solve (board, col+1) == 1)
            {
                return 1;
            }
            board[i][col]=0;

        }
    }

    return 0;
}

void display()
{
    memset(board,0,sizeof(int));

    if ( solve(board, 0) == 0 )
    {
      printf("Solution does not exist");
      return 0;
    }

    printSolution(board);
    return 1;

}


int main()
{
    scanf("%d",&n);
    display(board,0);
    return 0;
}
