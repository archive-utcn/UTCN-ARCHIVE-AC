#include<stdio.h>
#define pb push_back


int GR[400100],X[400100],Y[400100],C[400100];
int N,M,ANS,IND[400100];
vector<int> VANS;

int grupa(int i)
{
	if (GR[i] == i) return i;
	GR[i] = grupa(GR[i]);
	return GR[i];
}

void reuniune(int i,int j)
{
	GR[grupa(i)] = grupa(j);
}

bool cmpf(int i,int j)
{
	return(C[i] < C[j]);
}

int main()
{
	freopen("apm.in","r",stdin);
	freopen("apm.out","w",stdout);
	scanf("%d %d\n",&N,&M);
	for(int i = 1;i <= M;++i)
	{
		scanf("%d %d %d\n",&X[i],&Y[i],&C[i]);
		IND[i] = i;
	}

	for(int i = 1;i <= N; ++i) GR[i] = i;
	for(int i = 1;i <= N; ++i) GR[i] = i;
	sort(IND + 1,IND + M + 1,cmpf);
	for(int i = 1;i <= M; ++i)
	{
		if (grupa(X[IND[i]]) != grupa(Y[IND[i]])){
			ANS += C[IND[i]];reuniune(X[IND[i]],Y[IND[i]]);
			VANS.pb(IND[i]);
		}
	}
	printf("%d\n",ANS);
	printf("%d\n",N - 1);
	for(int i = 0;i < N - 1; ++i)
		printf("%d %d\n",X[VANS[i]],Y[VANS[i]]);
	return 0;
}
