#ifndef __FRAMETYPES_H__
#define __FRAMETYPES_H__

#include <systemc.h>

class slot
{
  public :
    bool       VALID;
    sc_lv<3>   ID;
    sc_lv<12>  VALUE;

  slot(int _ID);
};

class frame
{
  public :
    slot            *pSLOTS[8];  // 8 slots per frame
    long long int   WRITES[8];   // number of write attempts for a given slot
    long long int   FAILED[8];   // number of write attempts when FULL=1

    frame();
    ~frame();

    void all_slots_valid();
    void all_slots_invalid();

    int  check_loss_ratio(int _RATIO);
};

#endif //__FRAMETYPES_H__
