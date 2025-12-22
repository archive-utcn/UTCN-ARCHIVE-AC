#include <stdio.h>
#include <string.h>

void converteste(long long x, int b, char* rez){
	//se converteste x in baza b si se memoreaza cifrele in sirul de caractere rez, terminat cu 0
	
}

void test(int testi, long long x, int b, char* ans){
	char rez[100];
	converteste(x, b, rez);
	if (strcmp(rez, ans) == 0)
		printf("Test %d corect, rezultat: %20s, asteptat: %20s\n", testi, rez, ans);
	else
		printf("Test %d incorect, rezultat: %20s, asteptat: %20s\n", testi, rez, ans);
}

int main(){
	int testi = 0;
	long long xs[] = { 10, 345687, 100000000000, 1, 123456789456, 0 };
	int bs[] = { 2, 3, 8, 9, 5, 4 };
	char ans[][100] = { "1010", "122120012020", "1351035564000", "1", "4010314414230311", "0" };
	for (testi = 0; testi<sizeof(xs) / sizeof(long long); testi++)
		test(testi, xs[testi], bs[testi], ans[testi]);
	return 0;
}
