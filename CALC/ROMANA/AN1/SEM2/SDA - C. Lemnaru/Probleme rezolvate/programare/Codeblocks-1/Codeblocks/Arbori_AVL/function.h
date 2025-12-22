#ifndef FUNCTION_H_INCLUDED
#define FUNCTION_H_INCLUDED
typedef struct tip_NOD {
    int key;
    int ech;
    struct tip_NOD *st,*dr;
}NOD;

extern NOD* d_rot_st(NOD *p);
extern NOD* d_rot_dr(NOD *p);
extern NOD* echilibrare(NOD *p);
extern NOD* s_rot_dr(NOD *p);
extern NOD* s_rot_st(NOD *p);
extern NOD* insereaza(NOD *p,int x);
extern void drum_maxim(NOD* p,int *max,int lung);
extern void fact_ech(NOD *p);
#endif // FUNCTION_H_INCLUDED
