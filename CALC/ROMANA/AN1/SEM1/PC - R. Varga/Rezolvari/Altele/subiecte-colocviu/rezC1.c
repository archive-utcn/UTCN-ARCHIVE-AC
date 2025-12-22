#include <stdio.h>
#include <stdlib.h>

long long boboc(int x, int y){
    long long z = 0;
    long long p = 1;
    while(x != 0 || y != 0){
        int cx = x%10;
        int cy = y%10;
        int cz = cx + cy;
        z = z + p*cz;
        if (cz > 9)
            p = p * 100;
        else
            p = p * 10;
        x /= 10;
        y /= 10;
    }
    return z;
}

void desc1(long long z){
    // merge doar pt numere mici, z < 10^4
    int xs = -1, ys = -1;
    for(int x = 0; x < 1e4; x++){
        for(int y = x; y < 1e4; y++){
            long long z2 = boboc(x, y);
            if (z2 == z){
                if (x > xs){
                    xs = x;
                    ys = y;
                }
            }
        }
    }
    printf("%d %d\n", xs, ys);
}

void desc2(long long z){
    // incercam sa evitam pe cat posibil sa avem transport la sume
    // cifra c se descompune in doua parti in mod optim asa c = c/2 + (c-c/2)
    // daca x = y pana acum impartim cifre curenta la mijloc, altfel punem totull in x si 0 in y
    if (z < 2){
        printf("%d %d\n", 0, (int)z);
        return;
    }

    int c[20] = {0};
    int k = 0;
    while(z){
        c[k++] = z%10;
        z /= 10;
    }
    for(int i=0; i < k/2; i++){
        int aux = c[i];
        c[i] = c[k-1-i];
        c[k-1-i] = aux;
    }

    int cx[20] = {0};
    int cy[20] = {0};
    int i = 0;
    int j = 0;
    int egal = 1;

    //caz z incepe cu 19 tratat pe else
    if (c[0] == 1 && c[1] < 9){
        int s = c[0]*10 + c[1];
        cx[0] = s / 2;
        cy[0] = s - s/2;
        j = 2;
    }
    else{
        cx[0] = c[0]/2;
        cy[0] = c[0] - c[0]/2;
        j = 1;
    }
    egal &= cx[0] == cy[0];
    i++;
    while(j < k){
        if (egal){
            cx[i] = c[j] / 2;
            cy[i] = c[j] - cx[i];
        }
        else{
            cx[i] = c[j];
            cy[i] = 0;
        }
        egal &= cx[i] == cy[i];
        i++;
        j++;
    }
    for(int ii=cx[0]==0; ii<i; ii++)
        printf("%d", cx[ii]);
    printf(" ");
    for(int ii=0; ii<i; ii++)
        printf("%d", cy[ii]);
    puts("");
}

int main(){
//    int n;
//    scanf("%d", &n);
//    int X[n], Y[n];
//    for(int i=0; i<n; i++)
//        scanf("%d%d", X+i, Y+i);
//
//    for(int i=0; i<n; i++){
//        long long z = boboc(X[i], Y[i]);
//        printf("%d # %d = %lld\n", X[i], Y[i], z);
//    }

//    for(int z = 0; z < 20; z++){
//        desc1(z);
//        desc2(z);
//        puts("");
//    }

    desc2(1011);
    desc2(2111);
    desc2(111111);
    desc2(199);
    return 0;
}
