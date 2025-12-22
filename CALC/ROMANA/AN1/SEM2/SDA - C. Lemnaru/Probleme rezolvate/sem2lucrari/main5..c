#include <stdio.h>
#include <stdlib.h>

typedef int cheia;
typedef struct nod
{
   cheia key;
   int ech;
   struct nod *left, *right;
}nod;
nod * rad, *root;

void drum_maxim(nod* p,int *max,int lung)
{
  if (p!=NULL)
  {
     drum_maxim(p->right,max,lung+1);
     if ((p->left==NULL)&&(p->right==NULL)&&(max<lung))
        max=lung;
     drum_maxim(p->left,max,lung+1);
  }
}

void fact_ech(nod *p)
{
   int h_left,h_right;
   h_left=1; h_right=1;
   if(p->left!=NULL)
     drum_maxim(p->left,h_left,1);
   else
      h_left=0;
   if(p->right!=NULL)
     drum_maxim(p->right,h_right,1);
   else
      h_right=0;
   p->ech=h_right-h_left;
}
void insereaza(nod **p,int x)
{
    if (*p==NULL)
    { // daca nodul curent este NULL atunci
    //p=new nod; //se aloca spatiu pentru el in zona heap
    (*p)->key=x; //informatia devine x
    (*p)->ech=0; // factorul de echilibru este 0 - nodul este echilibrat

(*p)->right=NULL;// nodul se insereaza ca nod frunza
(*p)->left=NULL; //deci referintele catre copii sai sunt NULL
return *p;
    }
else {
   if (x<(*p)->key) //daca cheia care se doreste inserata este
             //mai mica ca valoare decat informatia din nodul curent
      insereaza((*p)->left,x);// atunci se insereaza
                //in subarborele stang al nodului curent
   else
      if (x>(*p)->key) //altfel daca cheia care se va insera
                //e mai mare decat informatia din nodul curent
          insereaza((*p)->right,x); // atunci se va insera
                //in subarborele drept
      else
         printf("Nodul exista deja");
      }
*p = echilibrare(*p);// daca intervin cazuri de dezechilibru
           //se va echilibra subarborele sau chiar arborele
}
void d_rot_right(nod **p)
{
    (*p)->left=s_rot_left((*p)->left);
    *p=s_rot_right(*p);
    return(*p);
}

void d_rot_left(nod **p)
{
    (*p)->right=s_rot_right((*p)->right);
    *p=s_rot_left(*p);
    return *p;
}

void s_rot_left(nod **p)
{
    nod *q;
    q=(*p)->right;
    (*p)->right=q->left;
    q->left=*p;
    fact_ech(*p);
    fact_ech(q);
    *p=q;
    return *p;
}

void s_rot_right(nod **p)
{nod *q;
    q=(*p)->left;
    (*p)->left=q->right;
    q->right=*p;
    fact_ech(*p);
    fact_ech(q);
    *p=q;
    return *p;
}
void echilibrare(nod *p){
  nod *w;
  fact_ech(p);//se calculeaza factorul de echilibru a nodului curent p
  if(p->ech==-2){// daca p nod este critic
    w=p->left; // atunci w este copilul stanga al lui p
    if (w->ech==1)// si daca acesta are factorul de echilibru 1
         d_rot_right(&p);// atunci se face dubla rotatie dreapta
    else//altfel se face o simpla rotatie dreapta
        s_rot_right(&p);
  }
  else
  if(p->ech==2){//daca p nod este critic
      w=p->right;//w este copilul dreapta al nodului curent p
      if (w->ech==-1)// si acesta are factorul de ech -1
          d_rot_left(&p);//se face o dubla rotatie stanga
      else//altfel se face o simpla rotatie stanga
          s_rot_left(&p);
  }
  return p;
}

void blabla ( cheia givenKey)
{
nod *p, *q;
p = ( nod *) malloc ( sizeof ( nod ) ) ;
p->key = givenKey;
p->left = p->right = NULL;
if ( root == NULL )
    {
    root = p;
    return;
    }
q = root ;
while (1)
{
    if ( givenKey < q->key )
        {
        if ( q-> left == NULL )
            {
            q->left = p;
            return;
            }
        else q = q->left ;
        }
    else
    if ( givenKey > q->key )
        {
        if ( q-> right == NULL )
            {
            q->right = p;
            return;
            }
        else q = q->right ;
        }

    return;
    }
}

void readm()
{
    int i;
    scanf("%d",&i);
    blabla(i);
    return;
}


void IN(nod *p)
{
    if (p->left != 0) {IN(p->left);}
     printf("%d; ",p->key);
    if (p->right != 0) {IN(p->right);}
    return ;
}

int main()
{

    int x,y;

    printf("introdu numaru de elemente\n");
    scanf("%d",&x);

    printf("introdu el \n");
    for (y=0;y<x;y++)
    printf("x=");
    scanf("%d",&x);
    IN(root);
    insereaza(&root,x);
    IN(root);
    return 0;
}
