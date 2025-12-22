library	IEEE;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;

entity status is
	port (ce_wr,clk, ce_rd: in std_logic;
	empty,last,full: out std_logic);
end entity;

architecture arh_status of status is

component C4UD is
	port(up, down, clk: in std_logic;
	q: out std_logic_vector(3 downto 0));
end component; 

signal q: std_logic_vector(3 downto 0);

begin
	Numarator: C4UD port map(up=>ce_wr, down=>ce_rd, clk=>CLK, q=>q);
	process(CLK, ce_wr, ce_rd, q)
	variable A,B,S0,S1,S2,S3,S4,S5,S6 : std_logic;
	variable emptyV,C: std_logic:='1';
	variable lastV,D,E, fullV: std_logic:='0';
	begin
	    A:=( q(0) and not (q(1)) and not (q(2)) and not (q(3)) );
		B:=( q(3) and q(2) and q(1) );
		S0:=(A and ce_rd);
		S1:=(lastV and not(ce_rd) and not (ce_wr) );
		S2:=(ce_wr and B);
		S3:=(not (B) and ce_wr and lastV);
		S4:=(ce_wr and lastV);
		S5:=(S0 or emptyV);
		S6:=(fullV or S4);
		C:=(S5 and not(ce_wr) );
		D:=(S1 or S2 or S3);
		E:=(not(ce_rd) and S6);
		
        if CLK'EVENT and CLK='1' then
		emptyV:=C;
		lastV:=D;
		fullV:=E;
	    end if;	
	
	EMPTY<=emptyV;
	LAST<=lastV;
	FULL<=fullV;
	end process;
	
end arh_status;
