#ifndef __TRANSACTOR_IF_H__
#define __TRANSACTOR_IF_H__

#include <systemc.h>
#include "transactor_args.h"


class transactor_task_if : virtual public sc_interface
{
public:
		virtual void initialize() = 0;
		virtual void send_message (char *msg) = 0;
};


class transactor_port_if : public sc_module
{
	public:
		sc_in<sc_logic > clk;
		sc_out<sc_logic > reset;
		sc_out<sc_logic > tx;

	transactor_port_if(sc_module_name nm) : sc_module(nm),
			clk("clk"),
			reset("reset"),
			tx("tx")
	{}
};



#endif // __TRANSACTOR_IF_H__

