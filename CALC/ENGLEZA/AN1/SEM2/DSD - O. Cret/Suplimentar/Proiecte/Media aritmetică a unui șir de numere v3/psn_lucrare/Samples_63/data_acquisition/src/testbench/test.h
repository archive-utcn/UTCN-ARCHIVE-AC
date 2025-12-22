#ifndef __TEST_H__
#define __TEST_H__

#include <systemc.h>
#include <scv.h>
#include "frametypes.h"
#include "transactor.h"

class test : public sc_module
{
  public:
    sc_port<transactor_task_interface> transactor_interface;

    frame *pTESTFRAME;

    SC_CTOR(test)
    {
      SC_THREAD(main);

      pTESTFRAME = new frame();
    }

    void main();

    ~test()
    {
      delete pTESTFRAME;
      pTESTFRAME = NULL;
    }
};

#endif //__TEST_H__
