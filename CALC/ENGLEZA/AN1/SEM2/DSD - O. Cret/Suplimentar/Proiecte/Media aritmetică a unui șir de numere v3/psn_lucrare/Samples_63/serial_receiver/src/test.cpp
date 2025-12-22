#include "test.h"

void test::main()
{
	transactor_interface->initialize();
	transactor_interface->send_message("This is an example of SystemC Transaction Level testbench.");
}

