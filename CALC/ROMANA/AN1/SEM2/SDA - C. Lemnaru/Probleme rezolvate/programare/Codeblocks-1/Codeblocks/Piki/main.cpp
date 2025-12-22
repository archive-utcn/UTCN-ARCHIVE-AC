#include <iostream>
using

namespace std;
int f(int,int);
int g(int,int);

int main()
{cout << f(5,20); }

 int f(int x,int y){
if
(x>=y)
return
x;
else
return
g(x,y-1);}

int g(int x,int y){
if
((x+y)>=5)
return
x+y-5;
else

return
 2*f(0,y);
 }
