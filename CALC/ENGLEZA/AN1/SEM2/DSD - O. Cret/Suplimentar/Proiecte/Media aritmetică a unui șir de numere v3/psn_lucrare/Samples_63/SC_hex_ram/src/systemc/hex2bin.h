#include <stdio.h>
#include <systemc.h>
#include "comp.h"
#include "simprims.h"

SC_MODULE(INTEL_HEX) {
sc_in<sc_logic> CLK,CLR,EN;
sc_in<char> CHR;
sc_out<sc_lv<16> > ADDR;
sc_out<sc_lv<8> > DATA;
sc_out<sc_logic> ERR;
sc_inout<sc_logic> WR;
sc_signal<sc_logic> SC,IS_HEX,TDC,ALE[4],DLE[2],CLE[2],LRC[4],DTC_EN,IWR_L,IWR_H,NCLK,ACE,WR_AUX;
sc_signal<sc_lv<4> > DGT,DHI,DH,DL;
sc_signal<sc_logic> c1;

IHEX_FSM  *CTRL;
ASCII_DEC *DEC;
ADDR_CNT  *ACNT;
DAT_CNT   *DCNT;
REG_4     *DTH[2],*DTL;
AND2      *DGL, *DGH;
AND2      *DTC_G;
INV       *CLK_INV;
DFF       *WR_CTRL[3];			

	SC_CTOR(INTEL_HEX) {
		//Constant initialisation
		c1 = sc_logic('1');
		//Clock inverter
		CLK_INV = new INV("ck_inv");
		CLK_INV->A(CLK);
		CLK_INV->Y(NCLK);
		//Main controll FSM
		CTRL = new IHEX_FSM("u1");
		CTRL->CLK(CLK);
		CTRL->CLR(CLR);
		CTRL->EN(EN);		
		CTRL->SC(SC);
		CTRL->IS_HEX(IS_HEX);
		CTRL->TDC(TDC);
		int i;
		for(i=0;i<2;i++)
		{
			CTRL->ALE[i](ALE[i]);
			CTRL->LRC[i](LRC[i]);
			CTRL->DLE[i](DLE[i]);
			CTRL->CLE[i](CLE[i]);
		}
		for(;i<4;i++)
		{
			CTRL->ALE[i](ALE[i]);
			CTRL->LRC[i](LRC[i]);
		}
		//Write logic
		WR_CTRL[0] = new DFF("wr0");
		WR_CTRL[0]->CLK(CLK);
		WR_CTRL[0]->CLR(CLR);
		WR_CTRL[0]->CE(c1);
		WR_CTRL[0]->D(IWR_L);
		WR_CTRL[0]->Q(WR_AUX);
		WR_CTRL[1] = new DFF("wr1");
		WR_CTRL[1]->CLK(NCLK);
		WR_CTRL[1]->CLR(CLR);
		WR_CTRL[1]->CE(c1);
		WR_CTRL[1]->D(WR_AUX);
		WR_CTRL[1]->Q(WR);
		WR_CTRL[2] = new DFF("wr2");				
		WR_CTRL[2]->CLK(CLK);		
		WR_CTRL[2]->CLR(CLR);		
		WR_CTRL[2]->CE(c1);		
		WR_CTRL[2]->D(WR);
		WR_CTRL[2]->Q(ACE);
		//Decoder
		DEC  = new ASCII_DEC("u2");
		DEC->CHR(CHR);
		DEC->DGT(DGT);
		DEC->SC(SC);
		DEC->IS_HEX(IS_HEX);
		//Address counter
		ACNT = new ADDR_CNT("u3");
		ACNT->CLK(CLK);
		ACNT->CE(ACE);
		ACNT->D(DGT);
		ACNT->Q(ADDR);
		ACNT->LD[0](ALE[0]);
		ACNT->LD[1](ALE[1]);
		ACNT->LD[2](ALE[2]);
		ACNT->LD[3](ALE[3]);
		//Data counter CE gate
		DTC_G = new AND2("u4a");
		DTC_G->A(EN);
		DTC_G->B(DLE[1]);
		DTC_G->Y(DTC_EN);
		//Data counter
		DCNT = new DAT_CNT("u4");
		DCNT->CLK(CLK);		
		DCNT->CE(IWR_H);		
		DCNT->LD[0](CLE[0]);
		DCNT->LD[1](CLE[1]);
		DCNT->D(DGT);
		DCNT->ZD(TDC);
		//Write signal
		DGH =  new AND2("u5");
		DGH->A(EN);
		DGH->B(DLE[1]);
		DGH->Y(IWR_H);
		DGL =  new AND2("u5a");
		DGL->A(EN);
		DGL->B(DLE[0]);
		DGL->Y(IWR_L);
		//Data register (High)
		DTH[1] = new REG_4("u6a");
		DTH[2] = new REG_4("u6b");
		DTH[1]->CLK(CLK);
		DTH[2]->CLK(CLK);
		DTH[1]->CE(IWR_H);
		DTH[1]->D(DGT);
		DTH[1]->Q(DHI);
		DTH[2]->CE(IWR_L);
		DTH[2]->D(DHI);
		DTH[2]->Q(DH);
		//Data register (Low)
		DTL = new REG_4("u7");
		DTL->CLK(CLK);
		DTL->CE(IWR_L);
		DTL->D(DGT);
		DTL->Q(DL);
		//Data bus concatenation
		SC_METHOD(DATA_Concat);
		sensitive(DH);
		sensitive(DL);			
	};
	void DATA_Concat();
	void AddToTrace(sc_trace_file *tf);	
};
