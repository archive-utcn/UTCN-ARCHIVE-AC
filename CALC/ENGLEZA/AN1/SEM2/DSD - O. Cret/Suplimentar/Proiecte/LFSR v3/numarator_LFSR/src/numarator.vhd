library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_arith.all; 
use ieee.numeric_std.all;

entity LFSR is
  port (
       cout : out std_logic_vector (5 downto 1); -- iesirea pe 5 biti             
     	clk : in  std_logic;					 -- semnalul de clock care intra in divizor
	  reset : in  std_logic;                     -- reset activ pe 1 
	   load : in  std_logic;	                 -- load activ pe 1
	 modulo : in std_logic;                      -- modulo activ pe 1
	  nr_IN : in  std_logic_vector (5 downto 1)	 -- numarul pt incarcare paralela
  );
end entity;

architecture ARHITECTURA of LFSR is
    signal numarare : std_logic_vector (5 downto 1);  -- numarul din bucla care va fi afisat
    signal feedback : std_logic;                      -- poarta COINCIDENTA
	signal clk_out : std_logic;						  -- semnalul de clock care iese din divizorul de frecventa
	
	component divizor_de_frecventa 
		port ( CLK_IN : in STD_LOGIC;
	          CLK_OUT : out STD_LOGIC);
	end component;
	
	
begin
	A1: divizor_de_frecventa port map (clk,clk_out);
    feedback <= not(numarare(5) xor numarare(3)); --poarta COINCIDENTA
    process (clk_out, reset, load, modulo, numarare)
	variable cat : integer := 1;                  -- o variabila care sa numere cate numere sunt in ciclu ciclu
	begin 
        	if (reset = '1') then -- daca resetul e 1, se afiseaza 00000
            	numarare <= (others=>'0');
			
			elsif (load = '1') then	-- daca avem incarcare paralela:
				numarare <= (nr_IN(5) & nr_IN(4) & nr_IN(3) & nr_IN(2) & nr_IN(1)); -- se afiseaza numarul de pe intrare 
			
        	elsif (modulo = '0' and rising_edge(clk_out)) then       -- cand clock-ul trece din 0 in 1, fara sa numaram modulo
                numarare <= (numarare(4) & numarare(3) & numarare(2) & numarare(1) & feedback);	-- se aplica regula de formare a numarului

			elsif (modulo = '1' and  (std_logic_vector(to_signed(cat,5))) = nr_IN and rising_edge(clk_out)) then -- daca numaram modulo si am ajuns la sfarsitul ciclului:
				cat := cat + 1;
				numarare <= "00000"; -- iesirea se face 00000
				cat := 1;            -- si numaratoarea incepe de la inceput
				
			elsif (modulo = '1' and (std_logic_vector(to_signed(cat,5))) /= nr_IN and rising_edge(clk_out)) then -- daca numaram modulo si nu am ajuns la sfarsitul ciclului de numarare:
				numarare <= (numarare(4) & numarare(3) & numarare(2) & numarare(1) & feedback);	 -- se formeaza numere dupa regula
				cat := cat + 1;	                                                                 -- si se numara in continuare
				
            end if;
    end process;
    cout <= numarare;
end architecture;