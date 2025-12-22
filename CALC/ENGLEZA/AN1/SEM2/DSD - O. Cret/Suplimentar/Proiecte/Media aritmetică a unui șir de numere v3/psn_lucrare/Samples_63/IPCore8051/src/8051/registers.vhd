--------------------------------------------------------------------------------------
-- Copyright (c) 1999 by Alatek. All rights reserved.
--
-- DESIGN        :   AL8051
-- FILE NAME     :   registers.vhd
-- DESCRIPTION   :   Auxiliary
--
-- CREATED       :   01/01/1999
-- MODIFIED      :   
-- VERSION       :   1.0
-- AUTHOR        :   Anatoli Sergyienko, Volodymir Lepekha
-- HISTORY       :   
--------------------------------------------------------------------------------------

package Registers is

type RAMemo is array (0 to 255) of BIT_VECTOR (7 downto 0);

	shared	variable RAM: RAMemo;	
	shared	variable com1: 	 Bit_Vector (7 downto 0);
	shared	variable i:    Integer	   range -300 to 65663 := 0;
	shared	variable com: 	 Bit_Vector (7 downto 0);
	alias Instruction is com1;
	alias PC is i;
	
	alias R0_bank0 : Bit_Vector(7 downto 0) is RAM(0);	  	  
	alias R1_bank0 : Bit_Vector(7 downto 0) is RAM(1);	  
	alias R2_bank0 : Bit_Vector(7 downto 0) is RAM(2);	  
	alias R3_bank0 : Bit_Vector(7 downto 0) is RAM(3);	  
	alias R4_bank0 : Bit_Vector(7 downto 0) is RAM(4);	  
	alias R5_bank0 : Bit_Vector(7 downto 0) is RAM(5);	  
	alias R6_bank0 : Bit_Vector(7 downto 0) is RAM(6);	  
	alias R7_bank0 : Bit_Vector(7 downto 0) is RAM(7);	
	alias R0_bank1 : Bit_Vector(7 downto 0) is RAM(8);	  
	alias R1_bank1 : Bit_Vector(7 downto 0) is RAM(9);	  
	alias R2_bank1 : Bit_Vector(7 downto 0) is RAM(10);	  
	alias R3_bank1 : Bit_Vector(7 downto 0) is RAM(11);	  
	alias R4_bank1 : Bit_Vector(7 downto 0) is RAM(12);	  
	alias R5_bank1 : Bit_Vector(7 downto 0) is RAM(13);	  
	alias R6_bank1 : Bit_Vector(7 downto 0) is RAM(14);	  
	alias R7_bank1 : Bit_Vector(7 downto 0) is RAM(15);	
	alias R0_bank2 : Bit_Vector(7 downto 0) is RAM(16);	  
	alias R1_bank2 : Bit_Vector(7 downto 0) is RAM(17);	  
	alias R2_bank2 : Bit_Vector(7 downto 0) is RAM(18);	  
	alias R3_bank2 : Bit_Vector(7 downto 0) is RAM(19);	  
	alias R4_bank2 : Bit_Vector(7 downto 0) is RAM(20);	  
	alias R5_bank2 : Bit_Vector(7 downto 0) is RAM(21);	  
	alias R6_bank2 : Bit_Vector(7 downto 0) is RAM(22);	  
	alias R7_bank2 : Bit_Vector(7 downto 0) is RAM(23);	
	alias R0_bank3 : Bit_Vector(7 downto 0) is RAM(24);	  
	alias R1_bank3 : Bit_Vector(7 downto 0) is RAM(25);	  
	alias R2_bank3 : Bit_Vector(7 downto 0) is RAM(26);	  
	alias R3_bank3 : Bit_Vector(7 downto 0) is RAM(27);	  
	alias R4_bank3 : Bit_Vector(7 downto 0) is RAM(28);	  
	alias R5_bank3 : Bit_Vector(7 downto 0) is RAM(29);	  
	alias R6_bank3 : Bit_Vector(7 downto 0) is RAM(30);	  
	alias R7_bank3 : Bit_Vector(7 downto 0) is RAM(31);	
	alias  P0 			 : Bit_Vector(7 downto 0) is RAM(128);  
	alias  SP			 : Bit_Vector(7 downto 0) is RAM(129);
	alias  DPL 		 : Bit_Vector(7 downto 0) is RAM(130);
	alias  DPH		 : Bit_Vector(7 downto 0) is RAM(131);
	alias  PCON	 : Bit_Vector(7 downto 0) is RAM(135);
	alias TCON	 : Bit_Vector(7 downto 0) is RAM(136);
	alias  thmOD	 : Bit_Vector(7 downto 0) is RAM(137);
	alias  TL0		 : Bit_Vector(7 downto 0) is RAM(138);
	alias  TL1		 : Bit_Vector(7 downto 0) is RAM(139);
	alias  TH0		 : Bit_Vector(7 downto 0) is RAM(140);
	alias  TH1		 : Bit_Vector(7 downto 0) is RAM(141);
	alias  P1			 : Bit_Vector(7 downto 0) is RAM(144);
	alias  SCON	 : Bit_Vector(7 downto 0) is RAM(152);
	alias  SBUF	 : Bit_Vector(7 downto 0) is RAM(153);
	alias  P2			 : Bit_Vector(7 downto 0) is RAM(160);
	alias  IE			 : Bit_Vector(7 downto 0) is RAM(168);
	alias  P3			 : Bit_Vector(7 downto 0) is RAM(176);
	alias  IP			 : Bit_Vector(7 downto 0) is RAM(184);
	alias  PSW		 : Bit_Vector(7 downto 0) is RAM(208);
	alias ACC 		 : Bit_Vector(7 downto 0) is RAM(224);
	alias  B			 : Bit_Vector(7 downto 0) is RAM(240);


end Registers; 


