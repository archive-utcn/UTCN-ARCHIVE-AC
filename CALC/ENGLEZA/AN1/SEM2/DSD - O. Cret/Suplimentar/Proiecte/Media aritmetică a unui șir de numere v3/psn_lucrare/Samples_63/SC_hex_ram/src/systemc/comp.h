#ifndef COMP_H
#define COMP_H
#include "simprims.h"

//------------------------------------------------------------------
SC_MODULE(ASCII_DEC) {
sc_in<char> CHR;
sc_out<sc_lv<4> > DGT;
sc_out<sc_logic> IS_HEX,SC;
	SC_CTOR(ASCII_DEC){
		SC_METHOD(Decode);
		sensitive(CHR);
	}
	void Decode();
};
//------------------------------------------------------------------
SC_MODULE(CD4029) {
sc_in<sc_logic> CLK,CE,LD,UP,BCD;
sc_in<sc_lv<4> > D;
sc_inout<sc_lv<4> > Q;
sc_out<sc_logic> CEO;
	SC_CTOR(CD4029) {
		SC_METHOD(LD4029);		
		sensitive(LD);
		sensitive(D);
		SC_METHOD(CLK4029);
		sensitive(CLK);
		SC_METHOD(CEO4029);
		sensitive(Q);
		sensitive(CE);
		sensitive(BCD);
		sensitive(UP);
	};
	void LD4029();
	void CLK4029();
	void CEO4029();
};
//------------------------------------------------------------------
SC_MODULE(ADDR_CNT) {
sc_in<sc_logic> CLK,CE,LD[4];
sc_in<sc_lv<4> > D;
sc_out<sc_lv<16> > Q;
sc_signal<sc_logic> CEI[4];
sc_signal<sc_lv<4> > QI[4];
sc_signal<sc_logic> c1,c0;
CD4029 *c[4];
	SC_CTOR(ADDR_CNT){
		int i;
		char s[10];
		c0 = sc_logic('0');
		c1 = sc_logic('1');
		for(i=0;i<4;i++)
		{
			sprintf(s,"ACNT_%d",i);
			c[i] = new CD4029(s);
			c[i]->CLK(CLK);
			c[i]->LD(LD[i]);
			c[i]->D(D);
			if(i)
				c[i]->CE(CEI[i-1]);
			else
				c[i]->CE(CE);		
			c[i]->CEO(CEI[i]);
			c[i]->Q(QI[i]);
			c[i]->BCD(c0);
			c[i]->UP(c1);
		}
		SC_METHOD(Q_MAP)
		sensitive(QI[0]);
		sensitive(QI[1]);
		sensitive(QI[2]);
		sensitive(QI[3]);
	}
	void Q_MAP();
};
//------------------------------------------------------------------
SC_MODULE(DAT_CNT) {
sc_in<sc_logic> CLK,CE,LD[2];
sc_in<sc_lv<4> > D;
sc_out<sc_logic> ZD;
sc_signal<sc_logic> CEI[2];
sc_signal<sc_lv<4> > QI[2];
sc_signal<sc_logic> c1,c0;
CD4029 *c[2];
	SC_CTOR(DAT_CNT){
		int i;
		char s[10];
		c0 = sc_logic('0');
		c1 = sc_logic('1');
		for(i=0;i<2;i++)
		{
			sprintf(s,"DCNT_%d",i);
			c[i] = new CD4029(s);
			c[i]->CLK(CLK);
			c[i]->LD(LD[i]);
			c[i]->D(D);
			if(i)
			{
				c[i]->CE(CEI[i-1]);				
			}
			else
			{
				c[i]->CE(CE);								
			}
			c[i]->CEO(CEI[i]);
			c[i]->Q(QI[i]);
			c[i]->BCD(c0);
			c[i]->UP(c0);
		}
		SC_METHOD(CO_ZD)
		sensitive(QI[0]);
		sensitive(QI[1]);
	}
	void CO_ZD();
	void AddToTrace(sc_trace_file *tf);
};
//------------------------------------------------------------------
SC_MODULE(REG_48) {
sc_in<sc_logic> CLK,CLR,CE[2];
sc_in<sc_lv<4> > D;
sc_out<sc_lv<8> > Q;
sc_lv<4> QI[2];
	SC_CTOR(REG_48) {
		SC_METHOD(REG_CLK);
		sensitive(CLK);
		sensitive(CLR);
	};
	void REG_CLK();
};
//------------------------------------------------------------------
SC_MODULE(SUB) {
sc_in<sc_logic> CLK,CLR,CE;
sc_in<sc_lv<8> > A;
sc_inout<sc_lv<8> > Q;
	SC_CTOR(SUB) {
		SC_METHOD(SUB_CLK);
		sensitive(CLK);
	};
	void SUB_CLK();
};
//------------------------------------------------------------------
SC_MODULE(CMP) {
sc_in<sc_lv<8> > A,B;
sc_out<sc_logic> EQ;
	SC_CTOR(CMP) {
		SC_METHOD(CMP_AB);
		sensitive(A);
		sensitive(B);
	}
	void CMP_AB();
};
//------------------------------------------------------------------
SC_MODULE(REG_4) {
sc_in<sc_logic> CLK,CE;
sc_in<sc_lv<4> > D;
sc_out<sc_lv<4> > Q;
	SC_CTOR(REG_4) {
		SC_METHOD(REG_4_CLK);
		sensitive(CLK);
	};
	void REG_4_CLK();
};
//------------------------------------------------------------------
enum STATE { 
	IDLE,
	DCH,
	DCL,
	ADHH,
	ADHL,
	ADLH,   
	ADLL,
	EMH,    
	EML,    
	DH,     
	DL,     
	MEMW,   
	LRCH,   
	LRCL,   
	CMPLRC,
	ERR };

SC_MODULE(IHEX_FSM) {
sc_in<sc_logic> CLK,CLR,EN,IS_HEX,SC,TDC;
sc_out<sc_logic> ALE[4],LRC[4],DLE[2],CLE[2];
sc_signal<STATE> Q, next_Q;
int i;
	SC_CTOR(IHEX_FSM) {
		SC_METHOD(FSM_NEXT_Q);
		sensitive(Q);
		sensitive(SC);
		sensitive(IS_HEX);
		sensitive(TDC);
		SC_METHOD(FSM_CLK);
		sensitive(CLK);
	};
	void FSM_NEXT_Q();
	void FSM_CLK();
};
//------------------------------------------------------------------
SC_MODULE(RAM64K) {
sc_in<sc_logic> WE,OE;
sc_in<sc_lv<16> > ADDR;
sc_inout_rv<8>  DATA;
char m[65536];
	SC_CTOR(RAM64K){
		SC_METHOD(ReadRAM);
		sensitive(ADDR);
		sensitive(OE);
		sensitive(WE);
		SC_METHOD(WriteRAM);
		sensitive(ADDR);
		sensitive(DATA);
		sensitive(OE);
		sensitive(WE);
	};
	void ReadRAM();
	void WriteRAM();
	int LoadRAM(char *fn, int len);
	int StoreRAM(char *fn, int len);
};
//------------------------------------------------------------------
#endif
