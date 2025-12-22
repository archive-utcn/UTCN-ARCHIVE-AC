----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:05 04/24/2013 
-- Design Name: 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--FSM With Three Processes VHDL Coding Example 
entity fsm_serial_tx is port 
( 
	btn0		: in std_logic;
	tx_data	: in std_logic_vector(7 downto 0);
	clk 		: IN std_logic; 
	tx 		: OUT std_logic 
	); 
	end entity; 

architecture beh1 of fsm_serial_tx is 

type state_type is (idle, start, data, stop); 
signal state, next_state : state_type ; 

signal b_en 		: std_logic;
signal bit_cnt 	: std_logic_vector(2 downto 0);
signal count		: std_logic_vector (12 downto 0);

begin 
		
		processcount: process (clk)
		begin
			 if rising_edge(clk) then 
				if count = 5207 then
					b_en <= '1';
					count <= (others => '0');
				else
					b_en <= '0';
					count<=count+1;
				end if;
			end if;
		end process; 

		process (clk) 
		begin 
			if (clk='1' and clk'Event) then 
				if b_en = '1' then 
					state <= next_state; 
				end if;
			end if; 
		end process; 
			
		process2: process (state) 
		begin
			case state is 
				when idle 	=> 
					next_state <= start; 
					bit_cnt <= (others => '0');
					
				when start 	=> 
					next_state <= data; 
					bit_cnt <= (others => '0');
					
				when data 	=> 
					if bit_cnt = 7 then
						next_state <= stop;
						bit_cnt <= (others => '0'); 
					else 
						next_state <= data;
						bit_cnt <= bit_cnt + 1;
					end if;
				
				when stop 	=> 
					next_state <= idle;
					bit_cnt <= (others => '0');
			end case; 
		end process process2;
		
		
		
		process3 : process (state, bit_cnt)
		begin
			case state is
				when idle 	=> tx <= '1'; 
				when start 	=> tx <= '0';
				when data 	=> tx <= tx_data(conv_integer(bit_cnt));
				when stop 	=> tx <= '1';
			end case; 
		end process process3; 
end beh1;

