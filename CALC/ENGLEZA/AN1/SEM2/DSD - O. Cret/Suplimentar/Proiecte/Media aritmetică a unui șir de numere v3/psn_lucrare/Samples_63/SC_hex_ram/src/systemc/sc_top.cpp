#include <systemc.h>
#include "hex2bin.h"

SC_MODULE (hex_ram) {
	sc_in<sc_logic> CLK,CLR,EN,C0,DUMP_RAM;
	sc_in<char> CHR;
	sc_out<sc_logic> WR,ERR;
	sc_out<sc_lv<16> > ADDR;
	sc_out<sc_lv<8> > DATA;

	sc_signal<sc_lv<16> > ADDR_int;
	sc_signal_rv<8> DATA_int;
	sc_signal<sc_logic> WR_int;

	INTEL_HEX *pHEX;
	RAM64K *pRAM;

	void addr_reader();
	void data_reader();
	void wr_reader();
	void dump_ram_to_file();

	SC_CTOR (hex_ram) :
	CLK("CLK"),
	CLR("CLR"),
	EN("EN"),
	C0("C0"),
	DUMP_RAM("DUMP_RAM"),
	CHR("CHR"),
	WR("WR"),
	ERR("ERR"),
	ADDR("ADDR"),
	DATA("DATA")
	{
		pHEX = new INTEL_HEX("u1");
		pHEX->CLK(CLK);
		pHEX->CLR(CLR);
		pHEX->EN(EN);
		pHEX->CHR(CHR);
		pHEX->ADDR(ADDR_int);
		pHEX->DATA(DATA_int);
		pHEX->WR(WR_int);
		pHEX->ERR(ERR);

		pRAM = new RAM64K ("u2");
		pRAM->ADDR(ADDR_int);
		pRAM->DATA(DATA_int);
		pRAM->OE(C0);
		pRAM->WE(WR_int);

		SC_METHOD(addr_reader);
		sensitive << ADDR_int;

		SC_METHOD(data_reader);
		sensitive << DATA_int;
		
		SC_METHOD(wr_reader);
		sensitive << WR_int;
		
		SC_METHOD(dump_ram_to_file);
		sensitive << DUMP_RAM;
	}

	~hex_ram() {
		delete pHEX;
		delete pRAM;
	}

};

void hex_ram::addr_reader() {
	ADDR = ADDR_int;	
}

void hex_ram::data_reader() {
	DATA = DATA_int;	
}

void hex_ram::wr_reader() {
	WR = WR_int;	
}

void hex_ram::dump_ram_to_file() {
	if(DUMP_RAM == SC_LOGIC_1)
		pRAM->StoreRAM("ram_dump",8192);
}

SC_MODULE_EXPORT(hex_ram);
