///////////////////////////////////////////////////////////////////////////////
//
// Author : Botau Cristian
// Task   : Text editor (it edits texts :)
//
///////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include <stdlib.h>
#include "textedit.cpp"
#include <ctype.h>
#include <conio.h>
#include <time.h>
#include "misc.h"

char clip[LINE_BUF_SIZE]; // clipboard

void delay(int ticks)
{
    for (clock_t start = clock(); clock() <= start + ticks; ) ;
}

void gotoxy(int x, int y)
{
  COORD coord;
  coord.X = x;
  coord.Y = y;
  SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

void draw_window(int xx, int yy, int xx1, int yy1)
{
    for (int i = xx; i <= xx1; ++i)
        gotoxy(i, yy), printf("*"),
        gotoxy(i, yy1), printf("*");
    for (int i = yy; i <= yy1; ++i)
        gotoxy(xx, i), printf("*"),
        gotoxy(xx1, i), printf("*");
        
}

int main()
{
    FILE *stream = fopen("textedit.cpp", "r");
    // initialize LineBuffer and EditContext
    LineBuffer text(stream);
    CEditContext Edit(4, 6, 80-9, 15, &text);
    
    strcpy(clip, ""); // clear clipboard
    int c = 0;
    char d[LINE_BUF_SIZE];
    
    do
    {
          system("cls"); // clear the screen
          printf("Text editor v0.6\n");
          draw_window(3, 5, 80-8+3, 16+5);
          Edit.Draw(0);
          
          // get user input
          c = getch();
          if (c == KEY_EXT)
          // Extended key pressed
          {
             c = getch();
             
             if (c == KEY_UP)    Edit.MoveRelCursor(0, -1);
             if (c == KEY_LEFT)  Edit.MoveRelCursor(-1, 0);
             if (c == KEY_DOWN)  Edit.MoveRelCursor(0, 1);
             if (c == KEY_RIGHT) Edit.MoveRelCursor(1, 0);

             if (c == KEY_DEL)
             {
               if (strlen(text.line[Edit.CCursor]) <= 1) text.DeleteLine(Edit.CCursor);
               else
               text.DeleteString(Edit.CCursor, Edit.LCursor,  1);
             }
          }
          else
          {
          
          if (c == KEY_CTRL_C)
              strcpy(clip, text.line[Edit.CCursor]);

          if (c == KEY_CTRL_X)
              strcpy(clip, text.line[Edit.CCursor]),
              text.DeleteLine(Edit.CCursor);
          
          if (c == KEY_CTRL_V)
              text.InsertLine(Edit.CCursor, clip);
          
          if (c == KEY_ENTER) 
          {
              if (Edit.LCursor == 0)
              {
                strcpy(d, "     ");
                text.InsertLine(Edit.CCursor, d), Edit.MoveRelCursor(0, 1);
              }
              else
              {
                text.InsertLine(Edit.CCursor + 1, text.line[Edit.CCursor] + Edit.LCursor);
                text.DeleteString(Edit.CCursor, Edit.LCursor, strlen(text.line[Edit.CCursor]) - Edit.LCursor);
                Edit.MoveCursor(0, Edit.CCursor + 1);
              }
          }
          
          if (c == KEY_BKSPACE)
              text.DeleteString(Edit.CCursor, Edit.LCursor-1,  1), Edit.MoveRelCursor(-1, 0);

          if (c == KEY_TAB)
              text.InsertString(Edit.CCursor, Edit.LCursor, "    "), Edit.MoveRelCursor(tab_size, 0);
              
          if (c >= 32 && c <= 126) 
          { 
                        d[0] = c;
                        d[1] = 0;
                        text.InsertString(Edit.CCursor, Edit.LCursor, d);
                        Edit.MoveRelCursor(1, 0);
          }
          }
    
    } while (c - 27);
    
    return 0;
}
