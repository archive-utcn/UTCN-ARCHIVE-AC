#define MAXN 100

struct POINT
{
    int x,y;
    int ind;    
};

struct MUCHIE
{
    int a,b;
    float c;
    int sel;   
};

void kruskal(MUCHIE c[MAXN], int dimc, int n, float& ct)
{
    int cc[MAXN];
    int much=0;
    for(int i=0; i<=n;i++) cc[i]=i;
    int k=1;
    while(much < n-1)
    {
        if(cc[c[k].a] <= cc[c[k].b])
        {
            c[k].sel=1;
            int min,max;
            if(cc[c[k].a] < cc[c[k].b])
            {
                min=cc[c[k].a];
                max=cc[c[k].b];
            }
            else
            {
                min=cc[c[k].b];
                max=cc[c[k].a];
            }
            for(int i=1;i<=n;i++)
            if(cc[i]==max) cc[i]=min;
            much++;
            ct+=c[k].c;
        }
        k++;   
    }
}
