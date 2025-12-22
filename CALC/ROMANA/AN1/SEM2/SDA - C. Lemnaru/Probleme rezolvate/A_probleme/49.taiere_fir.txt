/*49. Sa se scrie un program care sa gaseasca toate variantele, precum si cea optima pentru taierea unui fir de
lungime L în parti de lungimi L1, L2, ..., Ln date, în conditiile:
a) nu exista nici un fel de restrictie în ce priveste numarul de bucati din fiecare lungime;
b) se taie cel mult o bucata de fiecare lungime;
c) numarul de bucati de fiecare lungime sa difere prin cel mult o unitate.*/
#include <stdio.h>
#include <stdlib.h>

int lun[1024];
int sol[1024];
int solutii[1024][1024];
int verif[1024];

int l, n, min, csize, nr_sol;

void citire(){
    freopen("input.txt","r",stdin);

    scanf("%d %d\n", &l, &n);
    int i = 0;
    for (i=0; i<n; i++)
        scanf("%d", &lun[i]);
}

void init(){
    int i = 0;
    csize = 0;
    nr_sol = 0;
    min = l;
    for (i=0; i<n; i++)
        verif[i] = 0;
}

void scrie_sol(int s){
    int i;
    int size = 0;
    for (i=1; i<=solutii[s][0]; i++){
        printf("%d ", lun[solutii[s][i]]);
        size += lun[solutii[s][i]];
    }
    printf("| %d", l - size);
    if ( l - size == min )
        printf(" ( optim )");

    printf("\n");
}

void scriere(){
    int i = 0;
    for (i=0; i<nr_sol; i++)
        scrie_sol(i);
}

void adauga_sol(int k){
    int i;
    solutii[nr_sol][0] = k;
    for (i=0; i<k; i++)
        solutii[nr_sol][i+1] = sol[i];
    if (min > l - csize)
        min = l - csize;
    nr_sol ++;
}

int verif1(int p){
    printf("%d", p);
    return 0;
}

void back1(int k){
    int i;
    adauga_sol(k);
    for (i = 0; i<n; i++)
        if (csize + lun[i] <= l && (k == 0 || sol[k-1] <= i))
            sol[k] = i, csize += lun[i], back1(k+1), csize -= lun[i];
}

void back2(int k){
    int i;
    adauga_sol(k);
    for (i = 0; i<n; i++)
        if (csize + lun[i] <= l && (k == 0 || sol[k-1] < i) && verif[i] == 0){
            sol[k] = i;
            csize += lun[i];
            verif[i] = 1;
            back2(k+1);
            csize -= lun[i];
            verif[i] = 0;
    }
}

int verificare(){
    int i, j;
    for (i=0; i<n-1; i++)
        for (j=i+1; j<n; j++)
        if (abs(verif[i] - verif[j]) > 1)
            return 0;
    return 1;
}

void back3(int k){
    int i;
    if (verificare()){
        adauga_sol(k);
    }
    for (i = 0; i<n; i++)
        if (csize + lun[i] <= l && (k == 0 || sol[k-1] <= i)){
            sol[k] = i;
            csize += lun[i];
            verif[i]++;
            back3(k+1);
            csize -= lun[i];
            verif[i]--;
    }

}

int main(){
    citire();

    // prima cerinta
    printf("a) FARA LIMITE: \n");
    init();
    back1(0);
    scriere();

    // a doua cerinta
    printf("\nb) LIMITA DE EXISTENTA: \n");
    init();
    back2(0);
    scriere();

    // a treia cerinta
    printf("\nc) LIMITA COMPLEXA: \n");
    init();
    back3(0);
    scriere();

    printf("Backtracking done .. ");
    return 0;
}
