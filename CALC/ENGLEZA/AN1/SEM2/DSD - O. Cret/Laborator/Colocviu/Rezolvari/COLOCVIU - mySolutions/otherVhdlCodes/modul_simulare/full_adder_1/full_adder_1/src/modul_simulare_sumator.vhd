library ieee;
use ieee.std_logic_1164.all;

entity MS_SIMULATOR	IS
end MS_SIMULATOR;

architecture ARH of MS_SIMULATOR IS

SIGNAL A,B,CIN: bit;
SIGNAL COUT, S: bit;
COMPONENT full_adder_1 is
	port ( a, b,cin: in bit;
	cout, s: out bit);
end component; 

begin
	UST: ENTITY full_adder_1 port map(a,b,cin,cout,s);
	stimuli: process
	begin
		A<='0' after 5 ns;
		B<='0' AFTER 10 NS;
		CIN<='0' AFTER 15 NS;
		ASSERT(S='1')REport  "Testul a esuat pentru 0 0 0";
		ASSERT(COUT='1') report "Testul a esuat pentru 0 0 0";
		A<='1' after 5 ns;
		B<='0' AFTER 10 NS;
		CIN<='0' AFTER 15 NS;
		ASSERT(S='0')report "Testul a esuat pentru 1 0 0";
		ASSERT(COUT='1') report "Testul a esuat pentru 1 0 0";
		A<='0' after 20 ns;
		B<='1' AFTER 25 NS;
		CIN<='0' AFTER 30 NS;
		ASSERT(S='0') report "Testul a esuat pentru 0 1 0";
		ASSERT(COUT='1') report "Testul a esuat pentru 0 1 0";
		A<='0' after 35 ns;
		B<='0' AFTER 40 NS;
		CIN<='1' AFTER 45 NS;
		ASSERT(S='0') report "Testul a esuat pentru 0 0 0";
		ASSERT(COUT='1') report "Testul a esuat pentru 0 0 0"; 
		A<='1' after 50 ns;
		B<='1' AFTER 55 NS;
		CIN<='0' AFTER 60 NS;
		ASSERT(S='1') report "Testul a esuat pentru 1 1 0";  
		ASSERT(COUT='0') report "Testul a esuat pentru 1 1 0";	 
END PROCESS stimuli;
end ARH;
