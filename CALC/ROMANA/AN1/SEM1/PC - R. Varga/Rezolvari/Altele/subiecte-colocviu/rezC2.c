#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char s[3][51];
}ec;

void rep(char* s, int pos, char c){
    if (*s == 0)
        return;
    if (pos >= 0){
        if (pos == 0)
            s[0] = c;
        rep(s+1, pos-1, c);
    }
    if (pos == -2){
        if (*s == 'a')
            *s = c;
        rep(s+1, pos, c);
    }
    if (pos == -3){
        if (*s == 'b')
            *s = c;
        rep(s+1, pos, c);
    }
}

char* sum(char* s1, char* s2){
    int n1 = strlen(s1);
    int n2 = strlen(s2);
    int n = n1;
    if (n2 > n)
        n = n2;
    n+=2;
    char* rez = calloc(n, sizeof(char));
    int* v1 = calloc(n1, sizeof(int));
    int* v2 = calloc(n2, sizeof(int));

    // s1 = 123 s2 = 84
    for(int i=0; i < n1; i++)
        v1[n1-1-i] = s1[i] - '0';
    for(int i=0; i < n2; i++)
        v2[n2-1-i] = s2[i] - '0';
    // v1 = {3, 2, 1},  v2 = {4, 8}

    int t = 0;
    for(int i=0; i < n; i++){
        int x = t;
        if (i < n1)
            x += v1[i];
        if (i < n2)
            x += v2[i];
        rez[i] = (x%10) + '0';
        t = x / 10;
    }
    int len = n-1;
    while(len > 1 && rez[len-1] == '0')
        len--;
    rez[len] = 0;
    for(int i=0; i<len/2; i++){
        char aux = rez[i];
        rez[i] = rez[len-1-i];
        rez[len-1-i] = aux;
    }
    free(v1); free(v2);
//    puts(rez);
    return rez;
}

int main(){
    FILE* pf = fopen("inputC.txt", "r");
    if (!pf)
        return -1;
    int n;
    fscanf(pf, "%d ", &n);
    ec* v = calloc(n, sizeof(ec));
    char rand[151];
    for(int i=0; i < n; i++){
        fgets(rand, 150, pf);
        for(int j=0; rand[j]; j++)
            if (rand[j] == '+' || rand[j] == '=')
                rand[j] = ' ';
//        puts(rand);
        sscanf(rand, "%s%s%s", v[i].s[0], v[i].s[1], v[i].s[2]);
        printf("%s + %s = %s\n", v[i].s[0], v[i].s[1], v[i].s[2]);
    }

    char s1[100] = "1bb45aa89";
    rep(s1,  1, '2');
    puts(s1);
    char s2[100] = "1bb45aa89";
    rep(s2, -2, '2');
    puts(s2);

//    puts(sum("0", "0"));

    for(int i=0; i < n; i++){
        printf("ecuatia %d: ", i);
        int posibil = 0;
        for(int a = 0; a < 10; a++){
            for(int b = 0; b < 10; b++){
                ec e = v[i];
                for(int j=0; j<3; j++){
                    rep(e.s[j], -2, a+'0');
                    rep(e.s[j], -3, b+'0');
                }
                char* z = sum(e.s[0], e.s[1]);
                if (strcmp(z, e.s[2])==0){
                    posibil = 1;
                    printf("%s + %s = %s\n", e.s[0], e.s[1], e.s[2]);
                    free(z);
                    a = b = 10;
                    break;
                }
                free(z);
            }
        }
        if (!posibil)
            puts("imposibil");
    }
    return 0;
}
