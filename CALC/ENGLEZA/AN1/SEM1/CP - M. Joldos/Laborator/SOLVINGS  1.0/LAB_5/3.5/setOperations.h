#define MAX_LENGTH 100

extern void addElement(double a[],int *len_a, double element, int pos);
extern void intersection(double a[],int len_a, double b[], int len_b, double c[], int *len_c);
extern void reunion(double a[],int len_a,double b[],int len_b,double c[],int *len_c);
extern void subtract(double a[],int len_a, double b[],int len_b,double c[],int *len_c);
extern void readSet(double a[],int *len_a);
extern void showSet(double a[],int len_a);
