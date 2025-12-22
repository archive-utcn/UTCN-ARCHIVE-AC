#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(){
  int f;
  int p[2];
  if(pipe(p)<0){
      perror("Eroare la pipe");
      exit(1);}
  f=fork();
  if(f==0){
      close(p[1]);
      int m,n,s;
	  if(read(p[0],&n,sizeof(int))<0 || read(p[0],&m,sizeof(int))<0){
	     perror("Eroare la citire");
	     exit(3);
	  }
	  s=m+n;
	  printf("Suma numerelor %d si %d este %d ",n,m,s);
	  printf("\n");
	  close(p[0]);
	  exit(0);
    }else{
      close(p[0]);
      int m,n;
      printf("Dati primul numar:");
      scanf("%d",&n);
      printf("Dati al doilea numar:");
      scanf("%d",&m);
      if(write(p[1],&n,sizeof(int))<0 || write(p[1],&m,sizeof(int))<0){
          perror("Eroare la eroare la scriere");
          close(p[1]);
	      exit(4);
	  }}
  return 0;
}
