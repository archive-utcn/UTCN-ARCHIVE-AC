#include "hex2bin.h"

void INTEL_HEX::DATA_Concat()
{
	DATA.write((DH.read(),DL.read()));
}

void INTEL_HEX::AddToTrace(sc_trace_file *tf)
{
char s[255];
	printf("Module name: %s(%s)\n",name(),basename());
	sprintf(s,"SC_%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,SC,s);
	sprintf(s,"DTC_EN_%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,DTC_EN,s);
	sprintf(s,"IWR_H%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,IWR_H,s);
	sprintf(s,"TDC_%s(%s)",name(),basename());
	sprintf(s,"IWR_L%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,IWR_L,s);
	sprintf(s,"TDC_%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,TDC,s);
	sprintf(s,"CLE(0)_%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,CLE[0],s);
	sprintf(s,"CLE(1)_%s(%s)",name(),basename());
	printf(" %s\n",s);
	sc_trace(tf,CLE[1],s);
}
