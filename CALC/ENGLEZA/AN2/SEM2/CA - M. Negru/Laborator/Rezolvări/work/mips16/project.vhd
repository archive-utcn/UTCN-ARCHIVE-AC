----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:08 04/02/2013 
-- Design Name: 	 MIPS 16 bit
-- Module Name:    project - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity project is
    Port ( clk : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (3 downto 0);
			  sw 	: in  STD_LOGIC_VECTOR (7 downto 0);
			  led : out  STD_LOGIC_VECTOR (7 downto 0);
           an 	: out  STD_LOGIC_VECTOR (3 downto 0);
           cat : out  STD_LOGIC_VECTOR (6 downto 0);
           dp 	: out  STD_LOGIC 
			  );

end project;

architecture Behavioral of project is

component reg_file is
		port(
		clk	: in std_logic;
		ra1	: in std_logic_vector (3 downto 0);
		ra2	: in std_logic_vector (3 downto 0);
		wa		: in std_logic_vector (3 downto 0);
		wd		: in std_logic_vector (15 downto 0);
		rwr	: in std_logic;
		rd1	: out std_logic_vector (15 downto 0);
		rd2	: out std_logic_vector(15 downto 0);
		
		rdst	: in std_logic
	);
end component;

component mpg is
    Port ( clk		: in  STD_LOGIC;
           btn		: in  STD_LOGIC_VECTOR (3 downto 0);
           step	: out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component alu is
port (
		cod		: in STD_LOGIC_VECTOR (0 to 2);
		imm		: in std_logic_vector (3 downto 0);
		alu_b		: in std_logic; --selectul de la mux
		Aop, Bop	: in STD_LOGIC_VECTOR (15 downto 0); --Aop=rd1 Bop=rd2 (iesiri din reg_file)
		rez		: out STD_LOGIC_VECTOR (15 downto 0);
		zero		: out STD_LOGIC
);
end component;

component ram is 
port (
	clk		: in std_logic;
	we			: in std_logic;
	addr		: in std_logic_vector(15 downto 0);
	di			: in std_logic_vector(15 downto 0);
	m			: in std_logic; --selectul de la multiplexor
	wd			: out std_logic_vector (15 downto 0)
	);
end component;

component display is
    Port ( clk : in  STD_LOGIC;
           d1 	: in  STD_LOGIC_VECTOR (3 downto 0);
           d2 	: in  STD_LOGIC_VECTOR (3 downto 0);
           d3 	: in  STD_LOGIC_VECTOR (3 downto 0);
           d4 	: in  STD_LOGIC_VECTOR (3 downto 0);
			  cat : out  STD_LOGIC_VECTOR (6 downto 0);
           an 	: out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component control is
	Port (
		cod_instr	: in std_logic_vector (3 downto 0); 
		aluop			: out std_logic_vector (0 to 2); 	-- codul operatiei facut in ALU
		rdst			: out std_logic; 								-- selectul de la primul mux
		rwr			: out std_logic; 								-- write enable pt reg_file
		alu_b			: out std_logic;								-- selectul de la al doilea mux		
		we 			: out std_logic; 								-- enable de la RAM
		m				: out std_logic; 								-- enable de la memorie
		ja				: out std_logic; 								-- jumpul neconditionat
		breq		   : out std_logic								-- jumpul conditionat
	);
end component;


component instr_f is
	Port (
		step	: in STD_LOGIC;
		ja		: in STD_LOGIC;
		breq	: in STD_LOGIC;
		zero	: in STD_LOGIC; 
		instr	: out STD_LOGIC_vector (15 downto 0)
		);
end component;


signal step				: STD_LOGIC_VECTOR(3 downto 0);
signal rs, rt, rd, wa: STD_LOGIC_VECTOR(3 downto 0);
signal instr			: STD_LOGIC_VECTOR(15 downto 0);
signal rd1, rd2, wd	: STD_LOGIC_VECTOR(15 downto 0);
signal rez				: STD_LOGIC_VECTOR (15 downto 0);
signal rez_ram			: STD_LOGIC_VECTOR (15 downto 0);
signal afis				: STD_LOGIC_VECTOR (15 downto 0);
signal rwr 				: std_logic;			 				--write enable de la reg_file
signal rdst				: std_logic;			 				--selectul de la primul mux (cel de la reg_file)
signal imm				: std_logic_vector (3 downto 0); --valoarea imediata (sau adresa)
signal alu_b			: std_logic; 							--selectul de la al doilea mux (cel de la alu)
signal m					: std_logic; 							--selectul de la al treilea mux
signal we				: std_logic; 							--enable de la RAM
signal cod_instr		: std_logic_vector (3 downto 0);
signal aluop			: std_logic_vector (0 to 2);

signal ja, breq, zero: std_logic; 

begin 
-----------------------------------------------------------------------
--counter
monopulse : mpg
Port map 
(
		clk=>clk, 
		btn=>btn,
		step=>step
		);
-----------------------------------------------------------------------
--instr_f
instruction: instr_f	
Port map 
(
	step=>step(3),
	ja=>ja,
	breq=>breq,
	zero=>zero,
	instr=>instr
);

-----------------------------------------------------------------------
--CONTROLER 
controler: control 
Port map
(
		cod_instr	=>cod_instr,
		aluop			=>aluop,	
		rdst			=>rdst, 		
		rwr			=>rwr,
		alu_b			=>alu_b,
		we				=>we,
		m				=>m,	
		breq			=>breq,			
		ja				=>ja			
		
);
 -------------------------------------------------------------------
	--REGFILE - despartirea pe registrii
	cod_instr	<=instr(15 downto 12);
	rs				<=instr(11 downto 8);
	rt				<=instr(7 downto 4);
	rd				<=instr(3 downto 0);
	imm			<=instr(3 downto 0);
----------------------------------------------------------------------
register_file:reg_file
Port map(
	clk	=>step(3),
	ra1	=>rs,
	ra2	=>rt,
	wa		=>rd,
	rd1	=>rd1,
	rd2	=>rd2,
	wd		=>wd,
	rwr	=>rwr,
	rdst	=>rdst
); 
-----------------------------------------------------------------------
arith_logic: alu
Port map 
(
		cod	=>aluop,
		imm	=>instr(3 downto 0),--rd
		alu_b	=>alu_b,
		Aop	=>rd1,
		Bop	=>rd2,
   	rez	=>rez,
		zero	=>zero
		);

-----------------------------------------------------------------------
--RAM
memo_ram: ram
Port map 
(
	clk	=>step(3),
	we		=>we,
	addr	=>rez,
	di		=>rd2,
	m		=>m,
	wd		=>wd 
);
-----------------------------------------------------------------------
--wd<=rd1+rd2;
--wd<=rez;

	-- pentru afisarea in functie de switch valoare instr, rd1, rd2, wd(rez)
	process(sw)
	begin
		case sw(3 downto 0) is
			when "0000" => afis <= instr;
			when "0001" => afis <= rd1;
			when "0010" => afis <= rd2;
			when "0011" => afis <= x"000" & imm;
			when "0100" => afis <= rez;
			when "0101" => afis <= wd;
			when "0110" => afis <= wd;
			when "0111"=> afis<="0000000000000" & aluop;
			when others => afis <= instr;
		end case;
	end process;
	
disp: display
Port map (
			clk =>clk,
         d1	 =>afis(3 downto 0),
         d2	 =>afis(7 downto 4),
         d3	 =>afis(11 downto 8),
			d4	 =>afis(15 downto 12),
			cat =>cat,
         an  =>an
);

dp<='0';
						
led <= rdst & rwr & alu_b & we & m & breq & ja & '0';

end Behavioral;



