library ieee;
use ieee.std_logic_1164.all;
use work.maths_class.all;

entity FIR_32tap_8_8 is
	generic(
		coeff01 : single := 0.0;
		coeff02 : single := 0.0;
		coeff03 : single := 0.0;
		coeff04 : single := 0.0;
		coeff05 : single := 0.0;
		coeff06 : single := 0.0;
		coeff07 : single := 0.0;
		coeff08 : single := 0.0;
		coeff09 : single := 0.0;
		coeff10 : single := 0.0);
	port (
		a : in  std_ulogic_vector(7 downto 0);
		ce : std_logic;
		clock : in  std_ulogic;
		reset : in  std_ulogic;
		y : out std_ulogic_vector(20 downto 0)
		);
end FIR_32tap_8_8;

use work.fir_32_coeff_table.all;

architecture behavioural of FIR_32tap_8_8 is
  use work.maths_class.all;
  use work.matrix_class.all;
  use work.generic_functions.all;
  use work.generic_conversions.all;
  use work.mixed_operators.all;
  use work.twos_complement_types.all;

  constant number_of_taps: integer := 9;

  signal data_table: single_vector(number_of_taps-1 downto 0);

begin


  fir_algorithm: process (clock,reset)
    variable data_out : single;
    variable fir_result : single;
    variable data_table_var: single_vector(number_of_taps-1 downto 0);
    variable coefficient_table_var: single_vector(number_of_taps-1 downto 0):=
		(coeff01,coeff02,coeff03,coeff04,coeff05,coeff06,coeff07,coeff08,coeff09);
    variable tmp2 : single;
    variable num_taps_minus_1 : integer;
    variable y_result : twos_complement(20 downto 0);
  begin
	if reset = '1' then
		data_table <= (others => 0.0);
    elsif rising_edge(clock) then
      data_table_var := data_table;
      tmp2 := single(to_integer(to_twos_complement(a)));
      data_table_var := shift_fifo (data_table_var, tmp2);
      data_table <= data_table_var;
      num_taps_minus_1 := number_of_taps-1;
      fir_result := sum_of_products (
        lower_limit => 0,
        upper_limit => number_of_taps-1,
        a_in => reverse_order(data_table_var),
        b_in => coefficient_table_var
      );
      y_result := y_result = integer(fir_result);
      y <= to_std_ulogic_vector(y_result);
    end if;
  end process;

end behavioural;
