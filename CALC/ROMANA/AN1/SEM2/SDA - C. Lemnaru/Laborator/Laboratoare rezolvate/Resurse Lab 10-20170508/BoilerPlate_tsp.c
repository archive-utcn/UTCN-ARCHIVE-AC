#include <stdio.h>
#include <math.h>

//structura de data pt graf, matrice de adiacenta
double dist[100][100]; //distante dintre noduri
//nodurile grafului sunt puncte
typedef struct {
	double x, y;
} point;
point pts[100];
//nr de puncte/noduri
int n;
double optimal_sol;

void tsp_greedy(int x[]){
	//x[0], x[1], ..., x[n-1] contine o permutare a multimii 1:n
	for (int i = 0; i < n; i++)
		x[i] = i + 1;
}

void afisare(int x[]){
	double tour_length = 0;
	
	for (int i = 0; i < n-1; i++){
		printf("%d - ", x[i]);
		tour_length += dist[x[i]][x[i + 1]];
	}
	tour_length += dist[x[n - 1]][x[0]];
	printf("%d\n", x[n-1]);
	printf("tour length     = %f\n", tour_length);
	printf("optimal length  = %f\n", optimal_sol);
}

double euclidean_dist(int i, int j){
	return sqrt((pts[i].x - pts[j].x)*(pts[i].x - pts[j].x) + (pts[i].y - pts[j].y)*(pts[i].y - pts[j].y));
}

int main(){

	FILE* f = fopen("date_tsp.txt", "r");
	int dummy;
	fscanf(f,"%d", &n);
	for (int i = 1; i <= n; i++){
		fscanf(f,"%d%lf%lf", &dummy, &pts[i].x, &pts[i].y);
	}
	fscanf(f, "%lf", &optimal_sol);
	fclose(f);
	for (int i = 1; i <= n; i++){
		for (int j = i + 1; j <= n; j++){
			dist[i][j] = euclidean_dist(i, j);
			dist[j][i] = dist[i][j];
		}
	}

	int x[100];
	tsp_greedy(x);
	afisare(x);
	return 0;
}
