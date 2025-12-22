// FISIERUL: def2.h
enum Boolean {false,true};
typedef struct _intrare{
      char *nume;
      int atribut; // de obicei referinta la o structura de atribute
      }INTRARE;
class hash { //clasa tabela de dispersie
private:
      int D ; //dimensiunea tabelei
      int LIMITA_INCERCARI;
      INTRARE tabela_dispersie[71]; // tabela de simboluri
      // member functions
      // cautare intrare in tabela de simboluri
      int caut(char *);
      // functia de hashing
      int calcul_hash(char *);
      //creare spatiu memorie heap
      char * makesir(char *);
      //functii pentru modificare valoare intrare in tabela de dispersie
      int aux(int,int);
      int modif_incr(int);

public:
      // constructor
      hash(void);
      hash(int);
      // instalare simbol in tabela
      int install(char *, int);

      // modificare atribute intrare
      int assign_val(char *,int);
      //regasire informatie (valoare atribut)
      int retrieve_val(char *);
      // tiparire tabela de simboluri
      void print_tab_disp(void);
};
