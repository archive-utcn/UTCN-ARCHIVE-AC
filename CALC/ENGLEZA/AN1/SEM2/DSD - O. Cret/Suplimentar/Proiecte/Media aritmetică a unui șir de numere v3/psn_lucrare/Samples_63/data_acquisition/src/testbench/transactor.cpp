#include "transactor.h"

void transactor::send_frame(frame *_pFRAME)
{

  for (int i=0; i<8; i++)               // for each slot in a frame
  {
    VALID = _pFRAME->pSLOTS[i]->VALID;  // set value of VALID flag
    ID = _pFRAME->pSLOTS[i]->ID;        // show the slot ID
    VALUE = _pFRAME->pSLOTS[i]->VALUE;  // and current VALUE

    wait(WR_CLK.negedge_event());       // wait until falling edge

    if (_pFRAME->pSLOTS[i]->VALID)      // if a slot is to be written to FIFO
    {
      _pFRAME->WRITES[i]++;             // increment write count
    }

    if (FULL.read()==sc_logic_1)        // and if FIFO is full
    {
      _pFRAME->FAILED[i]++;             // increment fail count
    }

    wait(WR_CLK.posedge_event());       // wait for rising edge
  }

}

void transactor::initialize()
{
  TERMINATE.write(0);                   // clear termination flag
  RST.write(sc_logic_1);                // assert reset
  VALID.write(0);
  ID.write(0);
  VALUE.write(0);

  wait(WR_CLK.posedge_event());         // wait for the write process to reset
  wait(RD_CLK.posedge_event());         // wait for the read process to reset
  RST.write(sc_logic_0);                // clear reset
}

void transactor::terminate()
{
  TERMINATE.write(1);                   // set termination flag to stop
}
