#ifndef __TEST_H__
#define __TEST_H__

#include <systemc.h>
#include "transactor.h"

class test : public sc_module
{
public:
	sc_port<transactor_task_if> transactor_interface;

	SC_CTOR(test)
	{
		SC_THREAD(main);
	}

	void main();

};

#endif //__TEST_H__

