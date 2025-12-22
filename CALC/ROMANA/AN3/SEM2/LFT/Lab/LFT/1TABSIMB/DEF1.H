// FISIERUL: def1.h
// Declaratiile pentru obiectul tabela de dispersie deschisa

enum Boolean {false,true};

typedef struct _intrare{
      char *nume;
      int atribut;    // de obicei referinta la o structura de atribute
      struct _intrare *urm; // permite inlantuirea intrarilor de aceeasi      
                       // valoare
      }INTRARE;

class hash { //clasa tabela de dispersie
private:
      int D ; //dimensiunea tabelei
      INTRARE *tabela_dispersie[11]; // tabela de simboluri
      // functii membru
      // cautare intrare in tabela de simboluri
      INTRARE *caut(char *);
      // functia de hashing
      int calcul_hash(char *);
      //creare spatiu memorie heap
      char * makesir(char *);
public:
      // constructor
      hash(void);
      // instalare simbol in tabela
      INTRARE *install(char *, int);
      // modificare atribute intrare
      INTRARE *assign_val(char *,int);
      //regasire informatie (valoare atribut)
      int retrieve_val(char *);
      // stergere intrare din tabela de simboluri
      void del(char *);
      // tiparire tabela de simboluri
      void print_tab_disp(void);};
