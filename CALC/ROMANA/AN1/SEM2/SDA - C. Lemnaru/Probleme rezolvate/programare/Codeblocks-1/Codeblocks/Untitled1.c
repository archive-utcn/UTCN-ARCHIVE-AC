
#include <stdio.h>




struct StateSTR
{
  int Mlhs;        //nr missionaries on LHS    of river
  int Clhs;        //nr cannibals    on LHS    of river
  int pos;         //boat on LHS (0) or RHS(1) of river
  int Mrhs;        //nr missionaries on RHS    of river
  int Crhs;        //nr cannibals    on RHS    of river
  StateSTR *parent;//pointer to parent state
  int opUsed;
  bool operator==(const StateSTR & rhs) const
  {
    return ((Mlhs == rhs.Mlhs) && (Clhs == rhs.Clhs) &&
            (Mrhs == rhs.Mrhs) && (Crhs == rhs.Crhs) &&
            (pos  == rhs.pos));
  }
};

ostream & operator<< (ostream & out, const StateSTR & s)
{
  out << "Mlhs:" << s.Mlhs << endl;
  out << "Clhs:" << s.Clhs << endl;
  out << "Boat:" << s.pos  << endl;
  out << "Mrhs:" << s.Mrhs << endl;
  out << "Crhs:" << s.Crhs << endl << endl;
  return out;
}

bool validState(StateSTR *S)
{
  if(( (*S).Clhs < 0) || ( (*S).Clhs > 3)) return false;
  if(( (*S).Crhs < 0) || ( (*S).Crhs > 3)) return false;
  if(( (*S).Mlhs < 0) || ( (*S).Mlhs > 3)) return false;
  if(( (*S).Mrhs < 0) || ( (*S).Mrhs > 3)) return false;
  if(( (*S).pos != 0) && ( (*S).pos!= 1))  return false;
  if( (( (*S).Clhs >  (*S).Mlhs) && ( (*S).Mlhs > 0)) ||
      (( (*S).Crhs >  (*S).Mrhs) && ( (*S).Mrhs > 0)) )
    return false;
  return true;
}

//Apply each of ten possible operations to state.
//          m c side(0=left,1=right)
//case 0: C(0,1,0) --> carry one cannibal    to LHS
//case 1: C(0,2,0) --> carry two cannibals   to LHS
//case 2: C(1,0,0)
//case 3: C(2,0,0)
//case 4: C(1,1,0)
//case 5: C(0,1,1)
//case 6: C(0,2,1)
//case 7: C(1,0,1)  --> carry one missionary to RHS
//case 8: C(2,0,1)
//case 9: C(1,1,1)
StateSTR * nextState(StateSTR *Z, const int j)
{
  StateSTR * S = new StateSTR();
  (*S)         = (*Z);
  (*S).opUsed  = j;
  switch (j)
  {
    case 0: {  (*S).pos  -= 1;
               (*S).Mlhs += 0;
               (*S).Clhs += 1;
               (*S).Mrhs -= 0;
               (*S).Crhs -= 1;}
            break;
    case 1: {  (*S).pos  -= 1;
               (*S).Mlhs += 0;
               (*S).Clhs += 2;
               (*S).Mrhs -= 0;
               (*S).Crhs -= 2;}
            break;
    case 2: {  (*S).pos  -= 1;
               (*S).Mlhs += 1;
               (*S).Clhs += 0;
               (*S).Mrhs -= 1;
               (*S).Crhs -= 0;}
            break;
    case 3: {  (*S).pos  -= 1;
               (*S).Mlhs += 2;
               (*S).Clhs += 0;
               (*S).Mrhs -= 2;
               (*S).Crhs -= 0;}
            break;
    case 4: {  (*S).pos  -= 1;
               (*S).Mlhs += 1;
               (*S).Clhs += 1;
               (*S).Mrhs -= 1;
               (*S).Crhs -= 1;}
            break;
    case 5: {  (*S).pos  += 1;
               (*S).Mrhs += 0;
               (*S).Crhs += 1;
               (*S).Mlhs -= 0;
               (*S).Clhs -= 1;}
            break;
    case 6: {  (*S).pos  += 1;
               (*S).Mrhs += 0;
               (*S).Crhs += 2;
               (*S).Mlhs -= 0;
               (*S).Clhs -= 2;}
            break;
    case 7: {  (*S).pos  += 1;
               (*S).Mrhs += 1;
               (*S).Crhs += 0;
               (*S).Mlhs -= 1;
               (*S).Clhs -= 0;}
            break;
    case 8: {  (*S).pos  += 1;
               (*S).Mrhs += 2;
               (*S).Crhs += 0;
               (*S).Mlhs -= 2;
               (*S).Clhs -= 0;}
            break;
    case 9: {  (*S).pos  += 1;
               (*S).Mrhs += 1;
               (*S).Crhs += 1;
               (*S).Mlhs -= 1;
               (*S).Clhs -= 1;}
            break;
  }
  return S;
}

bool notFound(StateSTR *Y, list<StateSTR *>  OPEN,
                           list<StateSTR *>  CLOSED)
{
  list<StateSTR*>::iterator itr1 = OPEN.begin();
  list<StateSTR*>::iterator itr2 = CLOSED.begin();
  for(; itr1 != OPEN.end()  ; itr1++)
    if( (*(*itr1)) == (*Y) ) break;
  for(; itr2 != CLOSED.end(); itr2++)
    if( (*(*itr2)) == (*Y) ) break;

  if( (itr1 == OPEN.end()) && (itr2 == CLOSED.end()) )
    return true;
  return false;
}

void addChildren(list<StateSTR *> & OPEN,
                 list<StateSTR *> & CLOSED,
                 StateSTR      * Y )
{
  StateSTR *tState;
  for(int i = 0; i < 10; i++)
  {
    tState = nextState(Y, i);
    if( (validState(tState)) &&
                             (notFound(tState, OPEN, CLOSED)) )
    {
      (*tState).parent = Y;
      OPEN.push_front(tState);
    }
    else
      delete tState;
  }
  return;
}

void printOP(int n)
{
  switch (n)
  {
    case 0:  cout << "C(0,1,0)" << endl; break;
    case 1:  cout << "C(0,2,0)" << endl; break;
    case 2:  cout << "C(1,0,0)" << endl; break;
    case 3:  cout << "C(2,0,0)" << endl; break;
    case 4:  cout << "C(1,1,0)" << endl; break;
    case 5:  cout << "C(0,1,1)" << endl; break;
    case 6:  cout << "C(0,2,1)" << endl; break;
    case 7:  cout << "C(1,0,1)" << endl; break;
    case 8:  cout << "C(2,0,1)" << endl; break;
    case 9:  cout << "C(1,1,1)" << endl; break;
  }
}

//MAIN section
int main() {
  bool searchResult = false;
  stack<int> opsUsed;
  StateSTR START    = {3,3,0,0,0,NULL,-1};
  StateSTR GOAL     = {0,0,1,3,3,NULL};
  StateSTR *X;
  StateSTR *tempState;
  list<StateSTR *> OPEN;
  list<StateSTR *> CLOSED;
  OPEN.push_front(&START);

  while(!OPEN.empty())
  {
    X = OPEN.front(); //stack-like operation
    OPEN.pop_front(); //
    if ((*X) == GOAL)
    {
      searchResult = true;
      break;
    }
    else
    {
      addChildren(OPEN, CLOSED, X);
      CLOSED.push_back(X);
    }
  }
  //Display results
  if(searchResult == true)
  {
    cout << endl << "PATH" << endl;
    for(StateSTR * p = X; p!= NULL; p = (*p).parent)
      opsUsed.push((*p).opUsed);
  }
  while(!opsUsed.empty())
  {
    printOP(opsUsed.top());
    opsUsed.pop();
  }
  cout << endl;
  return 0;
}
