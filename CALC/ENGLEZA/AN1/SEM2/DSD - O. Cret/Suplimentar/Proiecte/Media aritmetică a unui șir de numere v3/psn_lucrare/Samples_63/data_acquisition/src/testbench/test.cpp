#include "test.h"

void test::main()
{
  const int REQUIRED_LOSS_RATIO = 100;        // loss ratio specified
  const	long int SIM_ITERATIONS = 2500000;    // number of frames to test
  
  scv_smart_ptr<int>   sp_VALID_SLOTS_NBR;    // smart pointer for randomization of
                                              // valid slots number

  scv_bag<int> sb_DISTRIB;                    // bag that describes probability distribution
  sb_DISTRIB.add(0, 44);
  sb_DISTRIB.add(1, 127);
  sb_DISTRIB.add(2, 706);
  sb_DISTRIB.add(3, 69);
  sb_DISTRIB.add(4, 33);
  sb_DISTRIB.add(5, 11);
  sb_DISTRIB.add(6, 5);
  sb_DISTRIB.add(7, 3);
  sb_DISTRIB.add(8, 2);

  sp_VALID_SLOTS_NBR->set_mode(sb_DISTRIB);   // apply the distribution

  scv_smart_ptr<int>  sp_ID;                  // smart pointer for ID randomization
  sp_ID->keep_only(0, 7);                     // constraint on the ID values

  scv_smart_ptr<sc_int<12> >  sp_VALUE;       // smart pointer to generate random VALUEs

  transactor_interface->initialize();         // reset first

  for (long int simiter=0; simiter<SIM_ITERATIONS; simiter++)
  {
    // get random number of valid slots according to the distribution
    sp_VALID_SLOTS_NBR->next();
    int VALID_SLOTS_NBR = *(sp_VALID_SLOTS_NBR->get_instance());

    // if valid slots < 5 it is faster to set VALID flags
    if (VALID_SLOTS_NBR<5)
    {
      pTESTFRAME->all_slots_invalid();        // clear VALID for all slots
      int VALIDATED = 0;

      while (VALIDATED<VALID_SLOTS_NBR)       // iterate to set appropriate number
      {
        sp_ID->next();                        // randomize ID
        int ID = *(sp_ID->get_instance());

        if (!pTESTFRAME->pSLOTS[ID]->VALID)   // if not set yet
        {
          pTESTFRAME->pSLOTS[ID]->VALID = 1;  // set
          VALIDATED++;
          sp_VALUE->next();                   // and randomize slot's VALUE
          pTESTFRAME->pSLOTS[ID]->VALUE = *(sp_VALUE->get_instance());
        }
      }
    }
    else  // if there is more than 4 slots valid then clearing is faster
    {
      pTESTFRAME->all_slots_valid();          // set VALID for all slots
      int INVALIDATED = 0;

      while (INVALIDATED<(8-VALID_SLOTS_NBR)) // iterate to clear appropriate number
      {
        sp_ID->next();                        // randomize ID
        int ID = *(sp_ID->get_instance());

        if (pTESTFRAME->pSLOTS[ID]->VALID)    // if not cleared yet
        {
          pTESTFRAME->pSLOTS[ID]->VALID = 0;  // clear
          INVALIDATED++;
          sp_VALUE->next();                   // and randomize slot's VALUE
          pTESTFRAME->pSLOTS[ID]->VALUE = *(sp_VALUE->get_instance());
        }
      }
    }

    // now it is time to send the generated frame by calling transactor method
    transactor_interface->send_frame(pTESTFRAME);

    if (pTESTFRAME->check_loss_ratio(REQUIRED_LOSS_RATIO))
    {
      transactor_interface->terminate();      // stop simulation if failed
    }
  }
  cout << "The FIFO has been tested with " << SIM_ITERATIONS << " frames and met the requirements." << endl;
  transactor_interface->terminate();          // stop simulation anyway
}
