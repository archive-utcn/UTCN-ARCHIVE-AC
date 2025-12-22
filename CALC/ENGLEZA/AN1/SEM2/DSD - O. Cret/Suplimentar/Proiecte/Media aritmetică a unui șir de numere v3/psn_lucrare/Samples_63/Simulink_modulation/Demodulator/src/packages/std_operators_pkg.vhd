library ieee;
use ieee.std_logic_1164.all;
use work.generic_functions.all;

package std_operators is

  function "+" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "+" (a, b: std_logic_vector) return std_logic_vector;
  function "-" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "*" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "/" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "mod" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "rem" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "**" (a, b: std_ulogic_vector) return std_ulogic_vector;
  function "+" (a: std_ulogic_vector) return std_ulogic_vector;
  function "-" (a: std_ulogic_vector) return std_ulogic_vector;
  function "abs" (a: std_ulogic_vector) return std_ulogic_vector;

end std_operators;




package body std_operators is

  function "+" (a, b: std_ulogic_vector) return std_ulogic_vector is
    constant y_length: integer := longest (a, b);
    variable a_extended, b_extended: std_ulogic_vector(y_length-1 downto 0);
    variable y: std_ulogic_vector(y_length-1 downto 0);
    variable carry: std_ulogic;
    variable a_add, b_add: std_ulogic_vector(y_length-1 downto 0);
  begin

    carry := '0';
    if (a'length < b'length) then
      for i in b'length-1 downto a'length loop
        a_extended(i) := '0';
      end loop;
      a_extended(a'length-1 downto 0) := a;
      b_add := b;
      for i in 0 to b'length-1 loop
        y(i) := a_extended(i) xor b_add(i) xor carry;
        carry := (a_extended(i) and b_add(i)) or
                 (a_extended(i) and carry) or
                 (b_add(i) and carry);
      end loop;
    elsif (a'length > b'length) then
      for i in a'length-1 downto b'length loop
        b_extended(i) := '0';
      end loop;
      b_extended(b'length-1 downto 0) := b;
      a_add := a;
      for i in 0 to a'length-1 loop
        y(i) := a_add(i) xor b_extended(i) xor carry;
        carry := (a_add(i) and b_extended(i)) or
                 (a_add(i) and carry) or
                 (b_extended(i) and carry);
      end loop;
    else
      a_add := a;
      b_add := b;
      for i in 0 to a'length-1 loop
        y(i) := a_add(i) xor b_add(i) xor carry;
        carry := (a_add(i) and b_add(i)) or
                 (a_add(i) and carry) or
                 (b_add(i) and carry);
      end loop;
    end if;

    return y;

  end "+";


  function "+" (a, b: std_logic_vector) return std_logic_vector is
    constant y_length: integer := longest (a, b);
    variable a_extended, b_extended: std_logic_vector(y_length-1 downto 0);
    variable y: std_logic_vector(y_length-1 downto 0);
    variable carry: std_logic;
    variable a_add, b_add: std_logic_vector(y_length-1 downto 0);
  begin

    carry := '0';
    if (a'length < b'length) then
      for i in b'length-1 downto a'length loop
        a_extended(i) := '0';
      end loop;
      a_extended(a'length-1 downto 0) := a;
      b_add := b;
      for i in 0 to b'length-1 loop
        y(i) := a_extended(i) xor b_add(i) xor carry;
        carry := (a_extended(i) and b_add(i)) or
                 (a_extended(i) and carry) or
                 (b_add(i) and carry);
      end loop;
    elsif (a'length > b'length) then
      for i in a'length-1 downto b'length loop
        b_extended(i) := '0';
      end loop;
      b_extended(b'length-1 downto 0) := b;
      a_add := a;
      for i in 0 to a'length-1 loop
        y(i) := a_add(i) xor b_extended(i) xor carry;
        carry := (a_add(i) and b_extended(i)) or
                 (a_add(i) and carry) or
                 (b_extended(i) and carry);
      end loop;
    else
      a_add := a;
      b_add := b;
      for i in 0 to a'length-1 loop
        y(i) := a_add(i) xor b_add(i) xor carry;
        carry := (a_add(i) and b_add(i)) or
                 (a_add(i) and carry) or
                 (b_add(i) and carry);
      end loop;
    end if;

    return y;

  end "+";


  function "-" (a, b: std_ulogic_vector) return std_ulogic_vector is
    constant y_length: integer := longest (a, b);
    variable a_extended, b_extended: std_ulogic_vector(y_length-1 downto 0);
    variable y: std_ulogic_vector(y_length-1 downto 0);
    variable carry: std_ulogic;
  begin

    carry := '1';
    if (a'length < b'length) then
      for i in b'length-1 downto a'length loop
        a_extended(i) := '0';
      end loop;
      a_extended(a'length-1 downto 0) := a;
      for i in 0 to b'length-1 loop
        y(i) := a_extended(i) xor (not b(i)) xor carry;
        carry := (a_extended(i) and (not b(i))) or
                 (a_extended(i) and carry) or
                 ((not b(i)) and carry);
      end loop;
    elsif (a'length > b'length) then
      for i in a'length-1 downto b'length loop
        b_extended(i) := '0';
      end loop;
      b_extended(b'length-1 downto 0) := b;
      for i in 0 to a'length-1 loop
        y(i) := a(i) xor (not b_extended(i)) xor carry;
        carry := (a(i) and (not b_extended(i))) or
                 (a(i) and carry) or
                 ((not b_extended(i)) and carry);
      end loop;
    else
      for i in 0 to a'length-1 loop
        y(i) := a(i) xor (not b(i)) xor carry;
        carry := (a(i) and (not b(i))) or
                 (a(i) and carry) or
                 ((not b(i)) and carry);
      end loop;
    end if;

    return y;

  end "-";


  function "*" (a, b: std_ulogic_vector) return std_ulogic_vector is
    constant y_length: integer := a'length + b'length;
    variable y_sign: std_ulogic;
    variable multiplicand: std_ulogic_vector(a'length-1 downto 0);
    variable multiplier: std_ulogic_vector(b'length-1 downto 0);
    variable partial_product: std_ulogic_vector(a'length-1 downto 0);
    variable product_lsb: std_ulogic_vector(b'length-1 downto 0);
    variable product: std_ulogic_vector(y_length-1 downto 0);
    variable y: std_ulogic_vector(y_length-1 downto 0);
  begin

    multiplicand := a;
    multiplier := b;
    for i in 0 to multiplicand'length-1 loop
      partial_product(i) := '0';
    end loop;
    for i in 0 to multiplier'length-1 loop
      if (multiplier(i) = '1') then
        partial_product := partial_product(a'length-1 downto 1) + multiplicand;
        product_lsb(i) := partial_product(0);
      else
        partial_product := '0' & partial_product(a'length-1 downto 1);
        product_lsb(i) := partial_product(0);
      end if;
    end loop;

    product := partial_product & product_lsb;
    y := product;

    return y;

  end "*";


  function "/" (a, b: std_ulogic_vector) return std_ulogic_vector is
    constant y_length: integer := a'length + b'length;
    constant a_extended_length: integer := b'length-1;
    variable a_extended: std_ulogic_vector(a_extended_length-1 downto 0);
    variable dividend_match: std_ulogic_vector(b'length-1 downto 0);
    variable quotient: std_ulogic_vector(a'length-1 downto 0);
    variable remainder: std_ulogic_vector(b'length-1 downto 0);
    variable y: std_ulogic_vector(y_length-1 downto 0);
  begin

    for i in a_extended_length-1 downto 0 loop
      a_extended(i) := '0';
    end loop;

    dividend_match(b'length-1 downto 1) := a_extended;

    for i in a'length-1 downto 0 loop
      dividend_match := dividend_match(b'length-1 downto 1) & a(i);
      if (b <= dividend_match) then
        dividend_match := dividend_match - b;
        quotient(i) := '1';
      else
        quotient(i) := '0';
      end if;
    end loop;

    remainder := dividend_match;
    y := quotient & remainder;

    return y;

  end "/";


  function "mod" (a, b: std_ulogic_vector) return std_ulogic_vector is
    constant y_length: integer := a'length + b'length;
    constant a_extended_length: integer := b'length-1;
    variable a_extended: std_ulogic_vector(a_extended_length-1 downto 0);
    variable dividend_match: std_ulogic_vector(b'length-1 downto 0);
    variable remainder: std_ulogic_vector(b'length-1 downto 0);
    variable y: std_ulogic_vector(b'length-1 downto 0);
  begin

    for i in a_extended_length-1 downto 0 loop
      a_extended(i) := '0';
    end loop;

    dividend_match(b'length-1 downto 1) := a_extended;

    for i in a'length-1 downto 0 loop
      dividend_match := dividend_match(b'length-1 downto 1) & a(i);
      if (b <= dividend_match) then
        dividend_match := dividend_match - b;
      end if;
    end loop;

    remainder := dividend_match;
    y := remainder;

    return y;

  end "mod";


  function "rem" (a, b: std_ulogic_vector) return std_ulogic_vector is
    constant y_length: integer := a'length + b'length;
    constant a_extended_length: integer := b'length-1;
    variable a_extended: std_ulogic_vector(a_extended_length-1 downto 0);
    variable dividend_match: std_ulogic_vector(b'length-1 downto 0);
    variable remainder: std_ulogic_vector(b'length-1 downto 0);
    variable y: std_ulogic_vector(b'length-1 downto 0);
  begin

    for i in a_extended_length-1 downto 0 loop
      a_extended(i) := '0';
    end loop;

    dividend_match(b'length-1 downto 1) := a_extended;

    for i in a'length-1 downto 0 loop
      dividend_match := dividend_match(b'length-1 downto 1) & a(i);
      if (b <= dividend_match) then
        dividend_match := dividend_match - b;
      end if;
    end loop;

    remainder := dividend_match;
    y := remainder;

    return y;

  end "rem";


  function "abs" (a: std_ulogic_vector) return std_ulogic_vector is
    variable y: std_ulogic_vector(a'length-1 downto 0);
  begin

    assert false
      report "Warning 0001." &
             "Library = work." &
             "Package Body = std_ulogic_operators." &
             "Function = abs." &
             "The function abs (std_ulogic_vector) is defined as ... " &
             "    <return_value> := <actual_parameter>    " &
             "Thus there is no point in taking the absolute value of an std_ulogic_vector."
        severity warning;
    y := a;

    return y;

  end "abs";


  function "+" (a: std_ulogic_vector) return std_ulogic_vector is
    variable y: std_ulogic_vector(a'length-1 downto 0);
  begin
    assert false
      report "Warning 0001." &
             "Library = work." &
             "Package Body = std_ulogic_operators." &
             "Function = +." &
             "The function + (std_ulogic_vector) is defined as ... " &
             "    <return_value> := <actual_parameter>    " &
             "Thus there is no point in taking the positive value of an std_ulogic_vector."
        severity warning;
    y := a;

    return y;

  end "+";


  function "-" (a: std_ulogic_vector) return std_ulogic_vector is
    variable y: std_ulogic_vector(a'length-1 downto 0);
  begin

    assert false
      report "Error 0001." &
             "Library = vfp." &
             "Package Body = std_ulogic_operators." &
             "Function = -." &
             "The function - (std_ulogic_vector) is not supported." &
             "However, 0 - <std_ulogic_vector_expression> IS supported."
        severity error;
    y := a;

    return y;

  end "-";

  function "**" (a, b: std_ulogic_vector) return std_ulogic_vector is
    variable y: std_ulogic_vector(a'length-1 downto 0);
  begin
    assert false
      report "Error 0001." &
             "Library = work." &
             "Package Body = std_ulogic_operators." &
             "Function = **." &
             "The function (std_ulogic_vector) ** (std_ulogic_vector) is not supported." &
             "However, to_std_ulogic_vector(to_integer(std_ulogic_vector) ** to_integer(std_ulogic_vector)) is supported."
        severity error;
      y := a;

    return y;

  end "**";

end std_operators;
