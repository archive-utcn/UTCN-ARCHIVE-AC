#include <stdio.h>
#include <set>
#include <vector>
#include <map>
#include <conio.h>

using namespace std;

int n;
map<pair<int,int>, char> R;
set<int> M;

int main ()
{
  printf("\n Please input the number of equations :\n ");
  scanf("%d", &n);
  
  int i, x, y;
  for (i=0;i<n;i++)
   {
      printf("(x%d, y%d) : ",i+1,i+1);
      scanf("%d%d",&x,&y);
      M.insert(x);
      M.insert(y);
      R[make_pair(x,y)]=1;
   }
  
  // show the content of M
  printf("M = { ");
  for (set<int>::iterator it=M.begin();it!=M.end();++it)
    printf("%d ", *it);
  printf(" }\n");
    
  int okS=1, okR=1, okT=1;
  //symmetric==>okS==1
  for (set<int>::iterator ix=M.begin();ix!=M.end()&&okS;++ix)
       for (set<int>::iterator iy=M.begin();iy!=M.end()&&okS;++iy)
               if (R[make_pair(*ix, *iy)]==1&&R[make_pair(*iy, *ix)]!=1)
                    okS = 0;
      
  //reflexive==>okR==1
  for (set<int>::iterator ix=M.begin();ix!=M.end()&&okR;++ix)
      if (R[make_pair(*ix, *ix)]==0)
         okR=0;
      
  //tranzitive==>okT==1
  for (set<int>::iterator ix=M.begin();ix!=M.end()&&okT;++ix)
       for (set<int>::iterator iy=M.begin();iy!=M.end()&&okT;++iy)
              if (R[make_pair(*ix, *iy)]==1)
                   for (set<int>::iterator iz=M.begin();iz!=M.end()&&okT;++iz)
                        if (R[make_pair(*iy, *iz)]==1&&R[make_pair(*ix, *iz)]==0)
                             okT=0;
     
  if (okS&&okR&&okT)
        printf("\n The relation is an equivalence relation.\n");
  else
        printf("\n It's not an equivalence relation.\n");
  
  getch ();
  return 0;
}
