#ifndef __TRANSACTOR_H__
#define __TRANSACTOR_H__

#include <systemc.h>
#include "frametypes.h"

class transactor_signal_interface : public sc_module
{
  public:
    sc_in<sc_logic>     WR_CLK;
    sc_in<sc_logic>     RD_CLK;
    sc_in<sc_logic>     FULL;

    sc_out<sc_logic>    RST;

    sc_out<bool>        VALID;
    sc_out<sc_uint<3> > ID;
    sc_out<sc_int<12> > VALUE;

    sc_out<bool>        TERMINATE;
};


class transactor_task_interface : virtual public sc_interface
{
  public:
    virtual void initialize() = 0;
    virtual void terminate() = 0;
    virtual void send_frame(frame *_pFRAME) = 0;
};


class transactor : public transactor_signal_interface,
                   public transactor_task_interface
{
  public:
    SC_CTOR(transactor)
    {
    }

    virtual void initialize();
    virtual void terminate();
    virtual void send_frame(frame *_pFRAME);
};

#endif //__TRANSACTOR_H__
