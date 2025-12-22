#ifndef SIMPRIMS_H
#define SIMPRIMS_H
#include <systemc.h>

SC_MODULE(DFF)
{
sc_in<sc_logic> CLK,CLR,CE,D;
sc_inout<sc_logic> Q;
	void Register();
	SC_CTOR(DFF) {
		SC_METHOD(Register)
		sensitive(CLK);
		sensitive(CLR);
	}
};

SC_MODULE(INV)
{
sc_in<sc_logic> A;
sc_inout<sc_logic> Y;
	void Assign();
	SC_CTOR(INV) {
		SC_METHOD(Assign)
		sensitive(A);		
	}
};

SC_MODULE(AND2)
{
sc_in<sc_logic> A,B;
sc_inout<sc_logic> Y;
	void Assign();
	SC_CTOR(AND2) {
		SC_METHOD(Assign)
		sensitive(A);
		sensitive(B);
	}
};


SC_MODULE(NAND2)
{
sc_in<sc_logic> A,B;
sc_inout<sc_logic> Y;
	void Assign();
	SC_CTOR(NAND2) {
		SC_METHOD(Assign)
		sensitive(A);
		sensitive(B);
	}
};

SC_MODULE(NAND3)
{
sc_in<sc_logic> A,B,C;
sc_inout<sc_logic> Y;
	void Assign();
	SC_CTOR(NAND3) {
		SC_METHOD(Assign)
		sensitive(A);
		sensitive(B);
		sensitive(C);
	}
};

SC_MODULE(OR2)
{
sc_in<sc_logic> A,B;
sc_inout<sc_logic> Y;	
	SC_CTOR(OR2) {
		SC_METHOD(Assign)
		sensitive(A);
		sensitive(B);
	}
	void Assign();
};

SC_MODULE(NOR2)
{
sc_in<sc_logic> A,B;
sc_inout<sc_logic> Y;
	void Assign();
	SC_CTOR(NOR2) {
		SC_METHOD(Assign)
		sensitive(A);
		sensitive(B);
	}
};

SC_MODULE(BUFT)
{
sc_in<sc_logic> A,T;
sc_inout<sc_logic> Y;
	void Assign();
	SC_CTOR(BUFT) {
		SC_METHOD(Assign)
		sensitive(A);
		sensitive(T);
	}
};

SC_MODULE(FDC)
{
sc_in<sc_logic> CLK,CLR,D;
sc_inout<sc_logic> Q;
sc_signal<sc_logic> S,SB,R,RB,QB;
NAND2 *u1,*u5;
NAND3 *u2,*u3,*u4,*u6;	
	SC_CTOR(FDC) {
		u1 = new NAND2("u1");
		u2 = new NAND3("u2");
		u3 = new NAND3("u3");
		u4 = new NAND3("u4");
		u5 = new NAND2("u5");
		u6 = new NAND3("u6");
		u1->Y(SB);
		u1->A(RB);
		u1->B(S);
		u2->Y(S);
		u2->A(CLR);
		u2->B(SB);
		u2->C(CLK);
		u3->Y(R);
		u3->A(S);
		u3->B(CLK);
		u3->C(RB);
		u4->Y(RB);
		u4->A(R);
		u4->B(CLR);
		u4->C(D);
		u5->Y(Q);
		u5->A(S);
		u5->B(QB);
		u6->Y(QB);
		u6->A(R);
		u6->B(Q);
		u6->C(CLR);
	}
};

SC_MODULE(TFF) {
sc_in<sc_logic> CLK,CLR;
sc_inout<sc_logic> Q,QN;
FDC *dff_1;
INV    *g1;	
	SC_CTOR(TFF) {
		dff_1 = new FDC("dff_1");
		g1    = new INV("g1");
		dff_1->CLK(CLK);
		dff_1->CLR(CLR);
		dff_1->D(QN);
		dff_1->Q(Q);
		g1->A(Q);
		g1->Y(QN);
	}
};

SC_MODULE(CNT4) {
sc_in<sc_logic> CLK,CLR;
sc_inout<sc_logic > Q[4];
sc_signal<sc_logic> CY[4];
TFF *tff0,*tff1,*tff2,*tff3;
	SC_CTOR(CNT4) {
		tff0 = new TFF("tff0");
		tff1 = new TFF("tff1");
		tff2 = new TFF("tff2");
		tff3 = new TFF("tff3");
		tff0->CLR(CLR);
		tff1->CLR(CLR);
		tff2->CLR(CLR);
		tff3->CLR(CLR);
		tff0->CLK(CLK);
		tff0->Q(Q[0]);
		tff0->QN(CY[0]);
		tff1->CLK(CY[0]);
		tff1->Q(Q[1]);
		tff1->QN(CY[1]);
		tff2->CLK(CY[1]);
		tff2->Q(Q[2]);
		tff2->QN(CY[2]);
		tff3->CLK(CY[2]);
		tff3->Q(Q[3]);
		tff3->QN(CY[3]);		
	}
};


#endif
