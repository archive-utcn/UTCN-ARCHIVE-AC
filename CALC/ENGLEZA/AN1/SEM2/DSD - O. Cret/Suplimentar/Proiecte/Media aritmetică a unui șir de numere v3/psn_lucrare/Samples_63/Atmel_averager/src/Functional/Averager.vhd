-- Copyright (c) 1996 by ATMEL Corp. All Rights Reserved.
--
-- Design:      VHDL model for a machine computing moving point averages 
--              of a (noisy) waveform
-- Author:      Atmel Corporation
-- Date:        March 16th, 1995
-- Description:
--
--
--              This file contains a VHDL description of a waveform averager
--              design.  An averager samples eight points from a moving waveform,
--              computes the averages of their amplitudes, and outputs the
--              averaged waveform which smooths out the spikes in the input.
--
--              The top level design is described at a structural level to make use
--              of the hard-macros automatically generated using generators
--              which are provided in ATMEL's FPGA development system.
--      
--              A behavioral VHDL is supplied underneath each of the
--              components that are instantiated in the top-level design.
--              A synthesis of the toplevel design with its components 
--              described in a behavioral VHDL can be performed to create a 
--		gate-level design that is truly technology independent (The
--		net-list will have only primitive gates mapped to ATMEL 
--		technology; and will also have macro hooks that are used in ATMEL
--		FPGAs to map single layout component. These hooks are generic
--		enough and may represent collection of gates in other technology).
--
--              When the optimized (EDIF) netlist is read in ATMEL's Figaro
--              layout system, the Figaro will resolve the component
--              names to hard macros in the layout library and use them in
--              place of the SEA OF GATES that a synthesis system has created.
--
--              This approach to FPGA design with synthesis as a front end
--              produces an efficient layout in ATMEL FPGAs and still retains the 
--		advantage of technology independent way of writing VHDL designs.
--
--		If a macro was found unavailable in a library or if a library was
--		not supplied at the time of the net-list reading, Figaro will use
--		the net-lists of the components produced by the synthesis.
--



--	Module:	add10reg
--	Description :
--		Adds two 10 bit registered operands.
--

library ieee ;
use ieee.std_logic_1164.all;
library exemplar ;
use exemplar.exemplar_1164.all;

ENTITY add10reg IS
        port(
                CLK,R		: IN std_logic;
                DATAA           : IN std_logic_vector(9 downto 0);
                DATAB           : IN std_logic_vector(9 downto 0);
                COUT            : OUT std_logic;
                SUM             : OUT std_logic_vector(9 downto 0)
        );
end add10reg;

ARCHITECTURE behv OF add10reg IS
signal result : std_logic_vector(10 downto 0);
signal operand1, operand2 : std_logic_vector(10 downto 0);

begin
	operand1(10) <= '0';
	operand2(10) <= '0';
	process(CLK,R,DATAA)
	begin
		if(R = '0') then
			operand1(9 downto 0) <= "0000000000";
		elsif (CLK = '1' and CLK'event) then
        		operand1(9 downto 0) <= DATAA; 
		end if;
	end process;

	process(CLK,R,DATAB)
	begin
		if(R = '0') then
			operand2(9 downto 0) <= "0000000000";
		elsif (CLK = '1' and CLK'event) then
        		operand2(9 downto 0) <= DATAB; 
		end if;
	end process;


        result <= operand1 + operand2;
        SUM <= result(9 downto 0); 
        COUT <= result(10) ;
end behv;

--	Module:	add9reg
--	Description :
--		Adds two 9 bit registered operands.
--

library ieee ;
use ieee.std_logic_1164.all;
library exemplar ;
use exemplar.exemplar_1164.all;

ENTITY add9reg IS
        port(
                CLK,R     : IN std_logic;
                DATAA           : IN std_logic_vector(8 downto 0);
                DATAB           : IN std_logic_vector(8 downto 0);
                COUT            : OUT std_logic;
                SUM             : OUT std_logic_vector(8 downto 0)
        );
end add9reg;

ARCHITECTURE behv OF add9reg IS
signal result : std_logic_vector(9 downto 0);
signal operand1, operand2 : std_logic_vector(9 downto 0);

begin
operand1(9) <= '0';
operand2(9) <= '0';

 process(CLK,R,DATAA)
        begin
                if(R = '0') then
                        operand1(8 downto 0) <= "000000000";
                elsif (CLK = '1' and CLK'event) then
                        operand1(8 downto 0) <= DATAA; 
                end if;
        end process;  
 
        process(CLK,R,DATAB)
        begin
                if(R = '0') then
                        operand2(8 downto 0) <= "000000000";
                elsif (CLK = '1' and CLK'event) then
                        operand2(8 downto 0) <= DATAB;
                end if;
        end process;

        result <= operand1 + operand2;
        SUM <= result(8 downto 0); 
        COUT <= result(9) ;
end behv;

--
--	Module:	reg8en
--	Description :
--		Registers an input signal and outputs it when enable is activated.
--


library ieee ;
use ieee.std_logic_1164.all;

ENTITY reg8en IS
	port(
		CLK,RN 	: IN std_logic;
		ENABLE	 	: IN std_logic;
		DATA 		: IN std_logic_vector(7 downto 0);
		Q  		: OUT std_logic_vector(7 downto 0)
	);
end reg8en;

ARCHITECTURE behv OF reg8en IS


begin
	process (CLK,RN,DATA)
	begin
		if(RN = '0') then
			Q <= "00000000";
		elsif (CLK = '1' and CLK'event) then
			if (ENABLE = '1') then
				Q <= DATA;
			else
			Q <= "00000000";
			end if;
		end if;
	end process;
end behv;
	

--
--	Module:	add8
--	Description :
--		An 8 bit adder.
--

library ieee;
use ieee.std_logic_1164.all;
library exemplar ;
use exemplar.exemplar_1164.all;

ENTITY add8 IS
        port(
                DATAA           : IN std_logic_vector(7 downto 0);
                DATAB           : IN std_logic_vector(7 downto 0);
                COUT            : OUT std_logic;
                SUM             : OUT std_logic_vector(7 downto 0)
        );
end add8;

ARCHITECTURE behv OF add8 IS
signal result : std_logic_vector(8 downto 0);
signal operand1, operand2 : std_logic_vector(8 downto 0);

begin
	operand1(8) <= '0';
	operand2(8) <= '0';
        operand1(7 downto 0) <= DATAA; 
        operand2(7 downto 0) <= DATAB;

        result <= operand1 + operand2 ;
        SUM <= result(7 downto 0); 
        COUT <= result(8) ;
end behv;

--
--	Module:	reg8
--	Description :
--		An 8 bit register.
--

library ieee ;
use ieee.std_logic_1164.all;

ENTITY reg8 IS
	port(
		CLK,RN 	: IN std_logic;
		DATA 		: IN std_logic_vector(7 downto 0);
		Q  		: OUT std_logic_vector(7 downto 0)
	);
end reg8;


ARCHITECTURE behv OF reg8 IS


begin
	process (CLK,RN,DATA)
	begin
		if(RN = '0') then
			Q <= "00000000";
		elsif (CLK = '1' and CLK'event) then
			Q <= DATA;
		end if;
	end process;
end behv;
	

--
--	Module:	sr9
--	Description :
--		An 9 bit shift-register.
--

library ieee ;
use ieee.std_logic_1164.all;

ENTITY sr9 IS
	port(
		CLK,RN 	: IN std_logic;
		SHIFTIN 	: IN std_logic;
		SHIFTOUT  	: OUT std_logic
	);
end sr9;

ARCHITECTURE behv OF sr9 IS

signal pipe : std_logic_vector(8 downto 0);

begin
	SHIFTOUT <= pipe(0);
	process (CLK,RN,pipe)
	begin
		if(RN = '0') then
			pipe <= "000000000";
		elsif (CLK = '1' and CLK'event) then
			pipe(7 downto 0) <= pipe (8 downto 1);
			pipe(8) <= SHIFTIN;
		end if;
	end process;
end behv;
	

--	Module:	initadd
--	Description :
--		Adds a number to its delayed value and produces a result. The input 
--		number is registered. It also forwards a delayed value of the input
--		number on a dataout port.
--	

library ieee ;
use ieee.std_logic_1164.all;

ENTITY initadd IS
        port(
                CLK,R     : IN std_logic;
                datain      : IN std_logic_vector(7 downto 0);
                dataout     : OUT std_logic_vector(7 downto 0);
                result     :  OUT std_logic_vector(8 downto 0)
        );
end initadd;

ARCHITECTURE behv OF initadd IS


component add8
        port (
                DATAA           : IN std_logic_vector(7 downto 0);
                DATAB           : IN std_logic_vector(7 downto 0);
                COUT            : OUT std_logic;
                SUM             : OUT std_logic_vector(7 downto 0)
        );
end component;



component reg8
	port (
                CLK,RN         : IN std_logic;
                DATA            : IN std_logic_vector(7 downto 0);
                Q               : OUT std_logic_vector(7 downto 0)
        );

end component;
attribute noopt: boolean;
attribute noopt of reg8:component is TRUE;

signal inta , temp_dataout : std_logic_vector(7 downto 0);

begin
	u1 : reg8 port map(
                CLK => CLK,
                RN => R,
		DATA => datain,
		Q => inta
		);
	u2 : reg8 port map(
                CLK => CLK,
                RN => R,
		DATA => inta,
		Q => temp_dataout
		);
		
 	u3 : add8 port map(
                DATAA => inta,
                DATAB => temp_dataout,
                COUT => result(8),
                SUM => result(7 downto 0));
	dataout <= temp_dataout;

end behv;

--
--	Module:	averager
--	Description :
--		Top level averager description. Please see the description
--		of the design at the beginning of this file. The Core requires
--		the top-level entity-architecture be placed at the end of the
--		file (if -entity= switch is not used).
--

library ieee ;
use ieee.std_logic_1164.all;

ENTITY averager IS
	port(
		CLK,R 	: IN std_logic;
		datain  	: IN std_logic_vector(7 downto 0);
		dataout  	: OUT std_logic_vector(7 downto 0)
	);
end averager;


ARCHITECTURE toplevel OF averager  IS

	COMPONENT initadd 
	port (
		CLK,R 	: IN std_logic;
		datain 		: IN std_logic_vector(7 downto 0);
		dataout 	: OUT std_logic_vector(7 downto 0);
		result 	  	: OUT std_logic_vector(8 downto 0)
	);
	end component;


component add9reg
        port (
		CLK,R 	: IN std_logic;
                DATAA		: IN std_logic_vector(8 downto 0);
                DATAB		: IN std_logic_vector(8 downto 0);
                COUT		: OUT std_logic;
                SUM		: OUT std_logic_vector(8 downto 0)
        );
end component;

component add10reg
        port (
		CLK,R 	: IN std_logic;
                DATAA		: IN std_logic_vector(9 downto 0);
                DATAB		: IN std_logic_vector(9 downto 0);
                COUT		: OUT std_logic;
                SUM		: OUT std_logic_vector(9 downto 0)
        );
end component;


component sr9
        port (
		CLK,RN 	: IN std_logic;
                SHIFTIN		: IN std_logic;
                SHIFTOUT	: OUT std_logic
        );
end component;
--attribute noopt: boolean;
--attribute noopt of sr9:component is TRUE;


component reg8en
        port (
		CLK,RN 	: IN std_logic;
                DATA		: IN std_logic_vector(7 downto 0);
                ENABLE		: IN std_logic;
                Q		: OUT std_logic_vector(7 downto 0)
        );
end component;
attribute noopt: boolean;
attribute noopt of reg8en:component is TRUE;

signal resulta,resultb,resultc,resultd : std_logic_vector(8 downto 0);
signal result9adda,result9addb : std_logic_vector(9 downto 0);
signal dout : std_logic_vector(10 downto 0);
signal inta,intb,intc : std_logic_vector(7 downto 0);
signal enable : std_logic;
signal clkarrived : std_logic;

begin
	process(CLK,R)
	begin
		if(R = '0') then
			clkarrived <= '0';
		elsif(CLK = '1' and CLK'event) then
			clkarrived <= '1';
		end if;
	end process;


	u1 : initadd port map(
		CLK => CLK,
		R => R,
		datain => datain,
		dataout => inta,
		result => resulta);

	u2 : initadd port map(
		CLK => CLK,
		R => R,
		datain => inta,
		dataout => intb,
		result => resultb);

	u3 : initadd port map(
		CLK => CLK,
		R => R,
		datain => intb,
		dataout => intc,
		result => resultc);

	u4 : initadd port map(
		CLK => CLK,
		R => R,
		datain => intc,
		result => resultd);

	u5 : add9reg port map(
		CLK => CLK,
		R => R,
		DATAA => resulta,
		DATAB => resultb,
		COUT => result9adda(9),
		SUM => result9adda(8 downto 0));

	u6 : add9reg port map(
		CLK => CLK,
		R => R,
		DATAA => resultc,
		DATAB => resultd,
		COUT => result9addb(9),
		SUM => result9addb(8 downto 0));

	u7 : add10reg port map(
		CLK => CLK,
		R => R,
		DATAA => result9adda,
		DATAB => result9addb,
		COUT => dout(10),
		SUM => dout(9 downto 0));

	u8 : reg8en port map(
		CLK => CLK,
		RN => R,
		ENABLE => enable,
		data => dout(10 downto 3),
		q => dataout);

	u9 : sr9 port map(
		CLK => CLK,
		RN => R,
		SHIFTIN => clkarrived,
		SHIFTOUT => enable);

end toplevel;
	
