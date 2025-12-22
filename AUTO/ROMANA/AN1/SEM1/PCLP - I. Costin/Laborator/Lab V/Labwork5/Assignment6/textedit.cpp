// BUGS : 
//  Unable to find / fix : Error deallocating memory (possibly in destructor)
#ifndef __TEXTEDIT__
#define __TEXTEDIT__
#include <stdio.h>
//#include <conio.h>
#include <string.h>
#include <stdlib.h>
#include <windows.h>

#define LINE_STRIP 256
#define LINE_BUF_SIZE 1024

inline int _min(int x, int y) 
{ return x < y ? x : y; };
inline int _max(int x, int y) { return x > y ? x : y; };

class LineBuffer
{
      public : 
      int linecount, memcount;
      char **line;
      
      LineBuffer() 
      { 
        linecount = 0;
        memcount  = LINE_STRIP;
 //           printf("Init : Lcnt, Mcnt : %d %d\n", linecount, memcount);
 //           getch();
        line      = new char* [LINE_STRIP]; 
        memset(line, 0, LINE_STRIP*sizeof(char*)); // clear line array
//            printf("Initialization ok!\n");
//            getch();
       };
       
       LineBuffer(FILE *istream)
       {
        char linebuf[LINE_BUF_SIZE];
        
        linecount = 0;
        memcount  = LINE_STRIP;
        line      = new char* [LINE_STRIP]; 
        memset(line, 0, LINE_STRIP*sizeof(char*)); // clear line array
        
        if (!istream) fprintf(stderr, "Warning : NULL stream!\n");
        while (!feof(istream))
        {
              if (fgets(linebuf, LINE_BUF_SIZE - 1, istream))
                 InsertLine(linecount, linebuf);
        }
      }
      
      ~LineBuffer() 
      { 
        linecount = memcount = 0; 
        int i;
        
        for (i = 0; i < linecount; ++i) ;
            delete line[i]; 
        
        delete line; 
      };
      
      void  InsertLine(int pos, char *nline)
      {
            // clamp pos
            if (pos > linecount) pos = linecount;
            if (pos < 0) pos = 0;
            
//            printf("Insert line : Lcnt, Mcnt : %d %d\n", linecount, memcount);
//            getch();
            
            // resize line buffer if required
            if (linecount > memcount) ResizeLineBuffer(memcount + LINE_STRIP);
            
//            printf("Insert line : Scrolling lines\n");
//            getch();
            
            // scroll lines
            for (int i = linecount; i > pos; --i)
                line[i] = line[i-1];
            
            line[pos] = new char[strlen(nline) + 2]; 
//            printf("line[%d] = nline (%s, %s)\n", pos, line[pos], nline);
//            getch();
            
            
            // copy strnig on its position
            strcpy(line[pos], nline);
            linecount++;
      };
      
      void  DeleteLine(int pos)
      {
            if (pos >= linecount) { fprintf(stderr, "Warning : Attempt to delete an invalid line\n"); return; };
            delete line[pos]; // free memory
            
            for (int i = pos; i < linecount - 1; ++i) // scroll lines up
                line[i] = line[i+1];
            
            line[--linecount] = NULL; // last line = NULL
      }

      void  InsertString(int ln, int lpos, char *text)
      {
//            printf("Insert string: Ln, lpos, text : %d %d %s\n", ln, lpos, text);
//            getch();
            int newlen;
            if (lpos >= strlen(line[ln])) lpos = strlen(line[ln]);
            
            char *newline = new char[newlen = strlen(line[ln]) + strlen(text) + 1];
            memset(newline, 0, newlen);
/*            
            newline[newlen-1] = 0;  // append the null character
            printf("%s\n", line[ln]);
            memmove(newline, line[ln], lpos - 1);
            printf("%s\n", newline);
            memmove(newline + lpos, text, strlen(text));
            printf("%s\n", newline + lpos);
            printf("%s\n", newline);
            memmove(newline + lpos + strlen(text), line[ln] + lpos, strlen(line[ln]) - lpos - 1);
*/
            strcat(strncpy(newline, line[ln], lpos), text);
            strcpy(newline + lpos + strlen(text), line[ln] + lpos);
            
           
            delete line[ln];
            line[ln] = newline;
      }

      void  DeleteString(int ln, int lpos, int clen)
      {
//            printf("Insert string: Ln, lpos, text : %d %d %s\n", ln, lpos, text);
//            getch();
            int newlen;
            if (lpos < 0) clen += lpos, lpos = 0;
            if (clen <= 0) return ;
            
            if (lpos >= strlen(line[ln])) lpos = strlen(line[ln]);
            if (clen >= strlen(line[ln]) - lpos - 1) clen = strlen(line[ln]) - lpos - 1;
            
            char *newline = new char[newlen = strlen(line[ln]) - clen + 1];
            memset(newline, 0, newlen);
/*            
            newline[newlen-1] = 0;  // append the null character
            printf("%s\n", line[ln]);
            memmove(newline, line[ln], lpos - 1);
            printf("%s\n", newline);
            memmove(newline + lpos, text, strlen(text));
            printf("%s\n", newline + lpos);
            printf("%s\n", newline);
            memmove(newline + lpos + strlen(text), line[ln] + lpos, strlen(line[ln]) - lpos - 1);
*/
            strncpy(newline, line[ln], lpos);
            strcpy(newline + lpos, line[ln] + lpos + clen);
           
            delete line[ln];
            line[ln] = newline;
      }

     char* GetString(int ln, int posl, char *result)
     {
          if (ln >= linecount) return NULL;
          
          if (posl > strlen(line[ln])) return NULL;
          
          return line[ln] + posl;
     }

     void   Print()
     {
            system("cls");
            for (int i = 0; i < linecount; ++i)
                printf("%s\n", line[i]);
     };
     
     private :
     void   ResizeLineBuffer(int newmemcount)
     {
//            printf("Resizing buffer\n");
//            getch();
            char **newline = new char* [newmemcount];
 
            memset(newline, 0, sizeof(char *) * newmemcount);
            memmove(newline, line, sizeof(char *) * linecount);
            delete line;
            
            line = newline;
            memcount = newmemcount;
     };
     
};

class CEditContext
{
      public :
      int X, Y, Width, Height, // coordinates of the Edit context
          LCursor, CCursor,
          XPage, YPage,
          bSplitLines;
      LineBuffer *LineBuf;
      
      ~CEditContext() { X = 0; };
      CEditContext()
      {
        X = 0, Y = 0, Width = 80, Height = 25;
        XPage = YPage = 0;
        LineBuf = new LineBuffer;
      };
    
      CEditContext(int x, int y, int width, int height, LineBuffer *LB)
      {
         X = x, Y = y, Width = width, Height = height;
         XPage = YPage = 0; LCursor = CCursor = 0;
         LineBuf = LB;
      };
      

      
      void MovePage(int x, int y) { XPage = x, YPage = y; };
      void MoveCursor(int nx, int ny)
      {
           // clamp values
           if (nx < 0) nx = 0;
           if (ny < 0) ny = 0;
           mgotoxy(41, 11);
           // printf("%d %d %d %d\n", nx, ny, LineBuf->linecount, LineBuf->line[ny] == NULL);
           if (ny >= LineBuf->linecount) ny = LineBuf->linecount - 1;
           if ( nx >= strlen(LineBuf->line[ny]) ) nx = strlen(LineBuf->line[ny])-1;
           mgotoxy(32, 22);
           // printf("%d %d %d %d\n", nx, ny, LineBuf->linecount, LineBuf->line[ny] == NULL);
           
           //
           int xm, ym;
           LCursor = nx, CCursor = ny;
           if (!InsidePage(nx, ny, xm, ym))
           {
              if (xm < 0) XPage = nx;
              if (ym < 0) YPage = ny;
              if (xm > 0) XPage = nx - Width + 1;
              if (ym > 0) YPage = ny - Height + 1;
           }
           
      }
      
      void mgotoxy(int x, int y)
      {
           COORD coord;
           coord.X = x;
           coord.Y = y;
           SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
      }

      void Draw(int clr)
      {
           char buf[LINE_BUF_SIZE];
           memset(buf, 0, sizeof(buf));
           
           if (clr) system("cls");
           
           for (int y = Y; (y < Y + Height) && (YPage + y - Y < LineBuf->linecount); ++y)
           {
               mgotoxy(X, y); 
               if (LineBuf->line[YPage + y - Y] != NULL) 
                  if (XPage < strlen(LineBuf->line[YPage + y - Y])) 
                  {
                     printf("%s\n", strncpy(buf, LineBuf->line[YPage + y - Y] + XPage, 
                     _min(Width, strlen(LineBuf->line[YPage + y - Y]) - XPage - 1))
                     /* LineBuf->line[YPage + y - Y]*/);
                     memset(buf, 0, sizeof(buf));
                  }
                  else
                      printf("\n");
           }
           
           // mgotoxy(50, 20);
           // printf("%d %d", LCursor, CCursor);
           
           mgotoxy(X + LCursor - XPage, Y + CCursor - YPage);
      } 
      
      void MoveRelCursor(int x, int y) { MoveCursor(LCursor + x, CCursor + y); };
      
      private :
      int InsidePage(int x, int y, int &xres, int &yres)
      {
          xres = 0, yres = 0;
          if (x < XPage) xres = -1; 
          if (y < YPage) yres = -1;
          if (x >= XPage + Width) xres = 1;
          if (y >= YPage + Height) yres = 1;
          return (!x && !y);
      }

};

#endif
