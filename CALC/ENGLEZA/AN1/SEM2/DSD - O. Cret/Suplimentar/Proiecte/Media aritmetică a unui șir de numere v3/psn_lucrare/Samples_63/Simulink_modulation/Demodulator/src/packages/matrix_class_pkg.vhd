use work.maths_class.all;

package matrix_class is

  type vfp_ulogic is ('0', '1', 'Z', 'X');

  type vfp_ulogic_2D_array is array (INTEGER range <>, INTEGER range <>) of vfp_ulogic;

  type integer_vector is array (INTEGER range <>) of INTEGER;
  type single_vector is array (INTEGER range <>) of single;
  type double_vector is array (INTEGER range <>) of double;

  type integer_matrix is array (INTEGER range <>, INTEGER range <>) of INTEGER;
  type single_matrix is array (INTEGER range <>, INTEGER range <>) of single;
  type double_matrix is array (INTEGER range <>, INTEGER range <>) of double;

  function sum_of_products (lower_limit : INTEGER; upper_limit : INTEGER; a_in : single_vector; b_in : single_vector) return single;
  function shift_fifo (fifo : single_vector; data_in : single) return single_vector;
  function reverse_order (table : single_vector) return single_vector;
  function "*" (multiplicand : single_matrix; multiplier : single_matrix) return single_matrix;

end matrix_class;


package body matrix_class is

  function sum_of_products (lower_limit : integer; upper_limit : integer; a_in : single_vector; b_in : single_vector) return single is
    variable partial_sum, running_total, sum : single;
    variable a : single_vector(a_in'length-1 downto 0);
    variable b : single_vector(b_in'length-1 downto 0);
  begin

    a := a_in(upper_limit downto lower_limit);
    b := b_in(upper_limit downto lower_limit);

    running_total := 0.0;
    for i in lower_limit to upper_limit loop
      partial_sum := a(i) * b(i);
      running_total := running_total + partial_sum;
    end loop;
    sum := running_total;

    return sum ;

  end sum_of_products;


  function shift_fifo (fifo : single_vector; data_in : single) return single_vector is
    variable fifo_out : single;
    variable fifo_queue : single_vector(fifo'length-1 downto 0);
    variable fifo_element : single;
  begin

    fifo_queue := fifo(fifo'length-1 downto 0);
    fifo_element := data_in;

    fifo_out := fifo_queue(fifo_queue'length-1);
    for i in fifo_queue'length-1 downto 1 loop
      fifo_queue(i) := fifo_queue(i-1);
    end loop;
    fifo_queue(0) := fifo_element;

    return fifo_queue ;

  end shift_fifo;

  function reverse_order ( table : single_vector) return single_vector is
    variable original_table : single_vector(table'length-1 downto 0);
    variable reversed_table : single_vector(table'length-1 downto 0);
  begin

    original_table := table(table'length-1 downto 0);

    for i in 0 to original_table'length-1 loop
      reversed_table(i) := original_table((original_table'length-1)-i);
    end loop;

    return reversed_table ;

  end reverse_order;


  function "*" (multiplicand : single_matrix; multiplier   : single_matrix) return single_matrix is
    variable a : single_matrix(0 to multiplicand'LENGTH(1)-1, 0 to multiplicand'LENGTH(2)-1);
    variable b : single_matrix(0 to multiplier'LENGTH(1)-1, 0 to multiplier'LENGTH(2)-1);
    variable result : single_matrix(0 to multiplicand'LENGTH(1)-1, 0 to multiplier'LENGTH(2)-1);
    variable partial_sum : single_matrix(0 to multiplicand'LENGTH(1)-1, 0 to multiplier'LENGTH(2)-1);
  begin

    a := multiplicand;
    b := multiplier;
    if (a'LENGTH(2) = b'LENGTH(1)) then
      for row in 0 to a'LENGTH(2)-1 loop
        for column in 0 to b'LENGTH(1)-1 loop
          result(row,column) := 0.0;
          for i in 0 to a'LENGTH(2)-1 loop
            partial_sum(row,column) := a(row,i) * b(i,column);
            result(row,column) := result(row,column) + partial_sum(row,column);
          end loop;
        end loop;
      end loop;
    else
      report "In function *, multiplicand column and multiplier row";
      report "lengths are not matched. This is not a VHDL error but";
      report "a mathematical requirement for matrix multiplication."
        severity WARNING;
    end if;

    return result;

  end "*";

end matrix_class;



