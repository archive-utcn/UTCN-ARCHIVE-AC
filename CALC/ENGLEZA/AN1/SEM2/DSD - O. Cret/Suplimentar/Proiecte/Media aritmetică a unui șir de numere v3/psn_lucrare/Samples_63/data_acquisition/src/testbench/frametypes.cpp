#include <iostream.h>

#include "frametypes.h"

slot::slot(int _ID)
{
  VALID = 0;
  ID    = _ID;  // the constructor automatically sets ID value for the slot
  VALUE = 0;
}


frame::frame()
{
  for (int i=0; i<8; i++)
  {
    pSLOTS[i] = new slot(i);  // create slots for the constructed frame
    WRITES[i] = 0;            // clear writes
    FAILED[i] = 0;            // and fails statistics
  }
}

frame::~frame()
{
  for (int i=0; i<8; i++)
  {
    delete pSLOTS[i];  // deallocate memory
    pSLOTS[i] = NULL;
  }
}

void frame::all_slots_valid()  // set VALID flags for all slots
{
  for (int i=0; i<8; i++)
  {
    pSLOTS[i]->VALID = 1;
  }
}

void frame::all_slots_invalid()  // clear VALID flags for all slots
{
  for (int i=0; i<8; i++)
  {
    pSLOTS[i]->VALID = 0;
  }
}

int frame::check_loss_ratio(int _RATIO)  // returns 1 and prints info if any of slots exceeds limit
{
  int EXCEEDED = 0;

  for (int i=0; i<8; i++)
  {
    if (FAILED[i])
    {
      double SLOT_RATIO = double(WRITES[i])/FAILED[i];

      if (SLOT_RATIO<_RATIO)
      {
        cout << "The loss ratio for slot " << i << " exceeds the required value of 1/" << _RATIO << "." << endl;
        EXCEEDED = 1;
      }
    }
  }

  return EXCEEDED;
}
