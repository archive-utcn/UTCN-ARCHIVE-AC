#include <stdio.h>

#include <string.h>
using namespace std;

bool is_operator(char c){

string operatori(“+-*/”);
if(operatori.find(c) != string::npos) return true;
return false;
}

int priority(char c){

if(c == ‘*’ || c == ‘/’ ) return 2;
if(c == ‘+’ || c == ‘-’ ) return 1;
return 0;
}

int main(){

string exp;
string exp_postfix;
stack<char> stiva;
char c;

getline(cin, exp);
exp.insert(exp.begin(), ‘(‘); // adaugare paranteze externe
exp.insert(exp.end(), ‘)’);
cout<<”Forma initiala: “<<exp<<endl; // afisare forma cu paranteze

for(string::iterator it = exp.begin(); it!=exp.end(); it++){
if(isdigit(*it)) {
exp_postfix.insert(exp_postfix.end(), *it);
continue;
}
if(is_operator(*it)){
int prioritate = priority(*it);
while(!stiva.empty()){
c=stiva.top();
if(is_operator(c) && priority(c) >= prioritate){
exp_postfix.insert(exp_postfix.end(), c);
stiva.pop();
}
else break;
}
stiva.push(*it);
continue;
}
if(*it == ‘(‘){
stiva.push(*it);
continue;
}
if(*it == ‘)’){
while ( (c = stiva.top()) != ‘(‘){
exp_postfix.insert(exp_postfix.end(), c);
stiva.pop();
}
stiva.pop();
continue;
}
if(isspace(*it)) continue;
}
cout<<”Forma postfixata: “<<exp_postfix<<endl;
return 0;
}
