#include <stdio.h>
#include <stdlib.h>

int n, d, x;

typedef struct
{
    int h, g;
} mar;

mar *mere;
int basket[1024];
int benzi[1024][1024];
int verif[1024];
int greutate = 0;

void citire()
{
    freopen("input.txt","r",stdin);
    scanf("%d %d %d\n", &n, &d, &x);

    mere = (mar*)malloc(sizeof(mar)*n);
    int i;
    for (i=0; i<n; i++)
        scanf("%d %d\n", &mere[i].g, &mere[i].h);

}

int get_max(int banda, int max_height){
    // returneaza cel mai greu mar necules de pe banda de greutate
    // @param banda: numarul benzii de pe care se culege marul
    // @param min_height: inaltimea maxima pe care o poate avea un mar ca sa poata fi cules
    if (benzi[banda][0] == 0)
        return -1;
    int i = 0;
    int max = -1;
    for (i=1; i<=benzi[banda][0]; i++)
        if (verif[benzi[banda][i]] == 0 && mere[benzi[banda][i]].h <= max_height)
            if (max == -1 || mere[benzi[banda][i]].g > mere[benzi[banda][max]].g)
                max = i;
    if ( max == -1 )
        return -1;
    return benzi[banda][max];

}

void culege()
{
    //creanga e la distanta 0 fata de sol


    int dist = 0;
    int basket_size = 0;
    int basket_weight = 0;

    int i;

    // genereaza benzile
    for (i=0; i<n; i++)
        benzi[i][0] = 0;
    for (i=0; i<n; i++){
        int b = 0;
        if (mere[i].h != 0){
            b = mere[i].h / x;
            if (mere[i].h % x != 0) b++;
        }
        benzi[b][++benzi[b][0]] = i;
    }

    // banda maxima
    int b_max = d / x;
    if ( d % x != 0 ){
        // culege cel mai inalt mar
        int max = get_max(b_max+1, d);
        if (max != -1){
            verif[max] = 1;
            basket[basket_size++] = max;
            basket_weight += mere[max].g;
        }
    }

    int over = 0;

    for (i = b_max; i>=0 && !over; i--){
        int j;
        j = i;
        while (j >= 0 && get_max(j, j*x) == -1)
            j--;
        if (j < 0)
            over = 1;
        else{
            int max = get_max(j, j*x);
            verif[max] = 1;
            basket[basket_size++] = max;
            basket_weight += mere[max].g;

        }
    }

    printf("Cantitatea totala de mere este: %d g\n", basket_weight);
    i = 0;
    printf("Merele culese ( in ordinea culegerii ) sunt: \n");
    for (i; i<basket_size; i++)
        printf("%d (%d, %d)\n", basket[i], mere[basket[i]].g, mere[basket[i]].h);
}

int main()
{
    citire();
    culege();

    return 0;
}
