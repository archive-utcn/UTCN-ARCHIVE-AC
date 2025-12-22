
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity anim_sixv2_counter is				--efect de "fade" a intregului mesaj
port(   
		CLK		: in std_logic;
		RST: in std_logic;
		O	: out std_logic_vector(11 downto 0));
end entity;

architecture anim_sixv2_counter of anim_sixv2_counter is
		
type nums is array(0 to 31) of integer range 0 to 255;
constant step : nums := (
	0	=>		0,
	1	=>		1,
	2	=>		2,
	3	=>		4,
	4	=>		6,
	5	=>		7,
	6	=>		9,
	7	=>		11,
	8	=>		12,
	9	=>		14,
	10	=>		16,
	11	=>		18,
	12	=>		20,
	13	=>		24,
	14	=>		27,
	15	=>		31,
	16	=>		33,
	17	=>		35,
	18	=>		38,
	19	=>		40,
	20	=>		43,
	21	=>		48,
	22	=>		55,
	23	=>		60,
	24	=>		66,
	25	=>		78,
	26	=>		88,
	27	=>		96,
	28	=>		120,
	29	=>		176,
	30	=>		200,
	31	=>		255
);		
		
begin

process(CLK)
variable CLKcount : integer range 0 to 2000000;    --controleaza viteza efectului de "fade"
variable PWMcount : integer range 0 to 1000;			--seteaza o perioada a animatiei de 512 impulsuri CLK
variable STEPcount : integer range 0 to 31;			--spune memoriei lungimea perioadei in care display-ul sta aprins
variable dir : integer range 0 to 3;
begin				

	if(CLK'EVENT and CLK='1')then							--o perioada=512 impulsuri CLK
		if(PWMcount = 256-step(STEPcount))then     
			PWMcount := PWMcount + 1;
			O<="000000000000";
		elsif(PWMcount = 256+step(STEPcount))then
			PWMcount := 0;
			O<="001010001011";			
		else
			PWMcount := PWMcount + 1;
		end if;		

		if(CLKcount = 2000000) then		
			if(dir = 0)then
				if(STEPcount = 31)then
					dir := 1;
				else
					STEPcount := STEPcount + 1;
				end if;	
				CLKcount := 0;
			else
				if(STEPcount = 1)then
					dir := 0;
				else
					STEPcount := STEPcount - 1;
				end if;	
				CLKcount := 0;			
			end if;				
		else	
			CLKcount := CLKcount + 1;
		end if;		
	end if;
end process;

end architecture;  

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_sixv2 is
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end entity;

architecture anim_sixv2 of anim_sixv2 is	 

component anim_sixv2_counter
	port(CLK:in std_logic;
	RST:std_logic;
	O:out std_logic_vector(11 downto 0));
end component;	   


signal letter_data:std_logic_vector(11 downto 0);
begin
	COUNT: anim_sixv2_counter port map(CLK,RST,letter_data);
	process(RST,enable,letter_data,disp)
	begin
	if RST='1' then 
		anim_out_addr<="000";
	else
		if enable='1' then
			case disp is
				when "1110" => anim_out_addr<=letter_data(2 downto 0);
				when "1101" => anim_out_addr<=letter_data(5 downto 3);
				when "1011" => anim_out_addr<=letter_data(8 downto 6);
				when "0111" => anim_out_addr<=letter_data(11 downto 9);
				when others => anim_out_addr<="000";
			end case;
		end if;
	end if;
	end process;
end architecture;