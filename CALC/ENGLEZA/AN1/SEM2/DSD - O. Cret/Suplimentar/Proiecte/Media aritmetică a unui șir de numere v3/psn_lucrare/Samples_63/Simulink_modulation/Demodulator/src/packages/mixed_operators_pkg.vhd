library ieee;
use ieee.std_logic_1164.all;
use work.twos_complement_types.all;
use work.generic_functions.all;
use work.generic_conversions.all;
use work.std_operators.all;

package mixed_operators is

  function "+" (a: std_ulogic_vector; b: integer) return std_ulogic_vector;
  function "+" (a: std_logic_vector; b: integer) return std_logic_vector;
  function "-" (a: std_ulogic_vector; b: integer) return std_ulogic_vector;
  function "-" (a: integer; b: std_ulogic_vector) return std_ulogic_vector;
  function "=" (a: std_ulogic_vector; b: integer) return std_ulogic_vector;
  function "=" (a: std_logic_vector; b: integer) return std_logic_vector;
  function "=" (a: twos_complement; b: integer) return twos_complement;

end mixed_operators;


package body mixed_operators is

  function "+" (a: std_ulogic_vector; b: integer) return std_ulogic_vector is
    variable b_length: integer := integer_wordlength (b);
    variable b_std_ulogic_vector: std_ulogic_vector(b_length-1 downto 0);
    variable y_length: integer := longest (a, b_std_ulogic_vector);
    variable y: std_ulogic_vector(y_length-1 downto 0);
  begin

    b_std_ulogic_vector := to_std_ulogic_vector (b);
    y := a + b_std_ulogic_vector;

    return y;

  end "+";


  function "+" (a: std_logic_vector; b: integer) return std_logic_vector is
    variable b_length: integer := integer_wordlength (b);
    variable b_std_logic_vector: std_logic_vector(b_length-1 downto 0);
    variable y_length: integer := longest (a, b_std_logic_vector);
    variable y: std_logic_vector(y_length-1 downto 0);
  begin

    b_std_logic_vector := to_std_logic_vector (b);
    y := a + b_std_logic_vector;

    return y;

  end "+";


  function "-" (a: std_ulogic_vector; b: integer) return std_ulogic_vector is
    variable b_length: integer := integer_wordlength (b);
    variable b_std_vector: std_ulogic_vector(b_length-1 downto 0);
    variable y_length: integer := longest (a, b_std_vector);
    variable y: std_ulogic_vector(y_length-1 downto 0);
  begin

    b_std_vector := to_std_ulogic_vector (b);
    y := a - b_std_vector;

    return y;

  end "-";


  function "-" (a: integer; b: std_ulogic_vector) return std_ulogic_vector is
    variable a_length: integer := integer_wordlength (a);
    variable a_std_vector: std_ulogic_vector(a_length-1 downto 0);
    variable y_length: integer := longest (b, a_std_vector);
    variable y: std_ulogic_vector(y_length-1 downto 0);
  begin

    a_std_vector := to_std_ulogic_vector (a);
    y := a_std_vector - b;

    return y;

  end "-";


  function "=" (a: std_ulogic_vector; b: integer) return std_ulogic_vector is
    variable b_length: integer := integer_wordlength (b);
    variable b_std_vector: std_ulogic_vector(b_length-1 downto 0);
    variable y: std_ulogic_vector(a'length-1 downto 0);
  begin

    b_std_vector := to_std_ulogic_vector (b);
    for i in 0 to (a'length - 1) loop
      if (i > (b_length - 1)) then
        y(i) := '0';
      else
        y(i) := b_std_vector(i);
      end if;
    end loop;

    return y;

  end "=";


  function "=" (a: std_logic_vector; b: integer) return std_logic_vector is
    variable b_length: integer := integer_wordlength (b);
    variable b_std_vector: std_logic_vector(b_length-1 downto 0);
    variable y: std_logic_vector(a'length-1 downto 0);
  begin
    b_std_vector := to_std_logic_vector (b);
    for i in 0 to (a'length - 1) loop
      if (i > (b_length - 1)) then
        y(i) := '0';
      else
        y(i) := b_std_vector(i);
      end if;
    end loop;

    return y;

  end "=";

  function "=" (a: twos_complement; b: integer) return twos_complement is
    variable b_length: integer := integer_wordlength (b);
    variable b_2sC_vector: twos_complement(b_length-1 downto 0);
    variable y: twos_complement(a'length-1 downto 0);
  begin

    b_2sC_vector := to_twos_complement (b);
    for i in 0 to (a'length - 1) loop
       if (i > (b_length - 1)) then
         y(i) := b_2sC_vector(b_length-1);
       else
         y(i) := b_2sC_vector(i);
       end if;
    end loop;

    return y;

  end "=";

end mixed_operators;
