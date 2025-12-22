library ieee;
use ieee.std_logic_1164.all;
use work.twos_complement_types.all;

package generic_functions is

  function abs_wordlength (a: twos_complement) return integer;
  function integer_wordlength (a: integer) return integer;
  function is_factor_of_32 (a: integer) return boolean;
  function is_power_of_2 (a: integer) return boolean;
  function log_2 (a: integer) return integer;
  function log_2 (a: std_ulogic_vector) return integer;
  function longest (a, b: std_ulogic_vector) return integer;
  function longest (a, b: std_logic_vector) return integer;
  function longest (a, b: twos_complement) return integer;
  function longest (a, b: time) return time;
  function longest (a, b, c: time) return time;
  function longest (a, b, c, d: time) return time;
  function longest (a, b, c, d, e: time) return time;
  function longest (a, b, c, d, e, f: time) return time;
  function longest (a, b, c, d, e, f, g: time) return time;
  function longest (a, b, c, d, e, f, g, h: time) return time;
  function longest (a, b, c, d, e, f, g, h, i: time) return time;
  function next_greater_binary_power_minus_1 (a: integer) return integer;

end generic_functions;


package body generic_functions is

  function longest (a, b: std_ulogic_vector) return integer is
    variable y: integer;
  begin

    if (a'length >= b'length) then
      y := a'length;
    else
      y := b'length;
    end if;

    return y;

  end longest;


  function longest (a, b: std_logic_vector) return integer is
    variable y: integer;
  begin

    if (a'length >= b'length) then
      y := a'length;
    else
      y := b'length;
    end if;

    return y;

  end longest;


  function longest (a, b: twos_complement) return integer is
    variable y: integer;
  begin

    if (a'length >= b'length) then
      y := a'length;
    else
      y := b'length;
    end if;

    return y;

  end longest;


  function is_factor_of_32 (a: integer) return boolean is
  begin

    case a is
      when 1 | 2 | 4 | 8 | 16 | 32 => return TRUE;
      when others => return FALSE;
    end case;

  end is_factor_of_32;


  function is_power_of_2 (a: integer) return boolean is
  begin

    case a is
      when 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128 | 256 | 512 | 1024 | 2048 |
           4096 | 8192 | 16384 | 32768 | 65536 | 131072 | 262144 | 524288 |
           1048576 | 2097152 | 4194304 | 8388608 | 16777216 | 33554432 |
           67108864 | 134217728 | 268435456 | 536870912 | 1073741824 => return TRUE;
      when others => return FALSE;
    end case;

  end is_power_of_2;


  function log_2 (a: integer) return integer is
    variable remainder : integer;
    variable log_2 : integer;
  begin

    if a > 0  then
      return integer_wordlength(a)-2;
    else
      assert FALSE
        report "log_2(a) returns an out-of-range value"
          severity warning;
      return integer'low;
    end if;

  end log_2;


  function log_2 (a: std_ulogic_vector) return integer is
    variable index : integer;
  begin

    index := a'length-1;
    while index > -1 loop
      if a(index) = '1' then
        return index;
      else
        index := index-1;
        if index = -1 then
          assert FALSE
            report "log_2(a) returns an out-of-range value"
              severity warning;
          return integer'low;
        end if;
      end if;
    end loop;

  end log_2;


  function longest (a, b: time) return time is
    variable y: time;
  begin

    if (a >= b) then
      y := a;
    else
      y := b;
    end if;

    return y;

  end longest;


  function longest (a, b, c: time) return time is
    variable ab: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (ab >= c) then
      y := ab;
    else
      y := c;
    end if;

    return y;

  end longest;


  function longest (a, b, c, d: time) return time is
    variable ab: time;
    variable cd: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (c >= d) then
      cd := c;
    else
      cd := d;
    end if;

    if (ab >= cd) then
      y := ab;
    else
      y := cd;
    end if;

    return y;

  end longest;


  function longest (a, b, c, d, e: time) return time is
    variable ab: time;
    variable cd: time;
    variable cde: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (c >= d) then
      cd := c;
    else
      cd := d;
    end if;

    if (cd >= e) then
      cde := cd;
    else
      cde := e;
    end if;

    if (ab >= cde) then
      y := ab;
    else
      y := cde;
    end if;

    return y;

  end longest;


  function longest (a, b, c, d, e, f: time) return time is
    variable ab: time;
    variable cd: time;
    variable ef: time;
    variable abcd: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (c >= d) then
      cd := c;
    else
      cd := d;
    end if;

    if (e >= f) then
      ef := e;
    else
      ef := f;
    end if;

    if (ab >= cd) then
      abcd := ab;
    else
      abcd := cd;
    end if;

    if (abcd >= ef) then
      y := abcd;
    else
      y := ef;
    end if;

    return y;

  end longest;


  function longest (a, b, c, d, e, f, g: time) return time is
    variable ab: time;
    variable cd: time;
    variable ef: time;
    variable efg: time;
    variable abcd: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (c >= d) then
      cd := c;
    else
      cd := d;
    end if;

    if (e >= f) then
      ef := e;
    else
      ef := f;
    end if;

    if (ef >= g) then
      efg := ef;
    else
      efg := g;
    end if;

    if (ab >= cd) then
      abcd := ab;
    else
      abcd := cd;
    end if;

    if (abcd >= efg) then
      y := abcd;
    else
      y := efg;
    end if;

    return y;

  end longest;


  function longest (a, b, c, d, e, f, g, h: time) return time is
    variable ab: time;
    variable cd: time;
    variable ef: time;
    variable gh: time;
    variable abcd: time;
    variable efgh: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (c >= d) then
      cd := c;
    else
      cd := d;
    end if;

    if (e >= f) then
      ef := e;
    else
      ef := f;
    end if;

    if (g >= h) then
      gh := g;
    else
      gh := h;
    end if;

    if (ab >= cd) then
      abcd := ab;
    else
      abcd := cd;
    end if;

    if (ef >= gh) then
      efgh := ef;
    else
      efgh := gh;
    end if;

    if (abcd >= efgh) then
      y := abcd;
    else
      y := efgh;
    end if;

    return y;

  end longest;


  function longest (a, b, c, d, e, f, g, h, i: time) return time is
    variable ab: time;
    variable cd: time;
    variable ef: time;
    variable gh: time;
    variable ghi: time;
    variable abcd: time;
    variable efghi: time;
    variable y: time;
  begin

    if (a >= b) then
      ab := a;
    else
      ab := b;
    end if;

    if (c >= d) then
      cd := c;
    else
      cd := d;
    end if;

    if (e >= f) then
      ef := e;
    else
      ef := f;
    end if;

    if (g >= h) then
      gh := g;
    else
      gh := h;
    end if;

    if (gh >= i) then
      ghi := gh;
    else
      ghi := i;
    end if;

    if (ab >= cd) then
      abcd := ab;
    else
      abcd := cd;
    end if;

    if (ef >= ghi) then
      efghi := ef;
    else
      efghi := ghi;
    end if;

    if (abcd >= efghi) then
      y := abcd;
    else
      y := efghi;
    end if;

    return y;

  end longest;


  function integer_wordlength (a: integer) return integer is
    variable wordlength: integer;
  begin

    if (a >= -2) and (a <= 1) then
      wordlength := 2;
    elsif (a >= -4) and (a <= 3) then
      wordlength := 3;
    elsif (a >= -8) and (a <= 7) then
      wordlength := 4;
    elsif (a >= -16) and (a <= 15) then
      wordlength := 5;
    elsif (a >= -32) and (a <= 31) then
      wordlength := 6;
    elsif (a >= -64) and (a <= 63) then
      wordlength := 7;
    elsif (a >= -128) and (a <= 127) then
      wordlength := 8;
    elsif (a >= -256) and (a <= 255) then
      wordlength := 9;
    elsif (a >= -512) and (a <= 511) then
      wordlength := 10;
    elsif (a >= -1024) and (a <= 1023) then
      wordlength := 11;
    elsif (a >= -2048) and (a <= 2047) then
      wordlength := 12;
    elsif (a >= -4096) and (a <= 4095) then
      wordlength := 13;
    elsif (a >= -8192) and (a <= 8191) then
      wordlength := 14;
    elsif (a >= -16384) and (a <= 16383) then
      wordlength := 15;
    elsif (a >= -32768) and (a <= 32767) then
      wordlength := 16;
    elsif (a >= -65536) and (a <= 65535) then
      wordlength := 17;
    elsif (a >= -131072) and (a <= 131071) then
      wordlength := 18;
    elsif (a >= -262144) and (a <= 262143) then
      wordlength := 19;
    elsif (a >= -524288) and (a <= 524287) then
      wordlength := 20;
    elsif (a >= -1048576) and (a <= 1048575) then
      wordlength := 21;
    elsif (a >= -2097152) and (a <= 2097151) then
      wordlength := 22;
    elsif (a >= -4194304) and (a <= 4194303) then
      wordlength := 23;
    elsif (a >= -8388608) and (a <= 8388607) then
      wordlength := 24;
    elsif (a >= -16777216) and (a <= 16777215) then
      wordlength := 25;
    elsif (a >= -33554432) and (a <= 33554431) then
      wordlength := 26;
    elsif (a >= -67108864) and (a <= 67108863) then
      wordlength := 27;
    elsif (a >= -134217728) and (a <= 134217727) then
      wordlength := 28;
    elsif (a >= -268435456) and (a <= 268435455) then
      wordlength := 29;
    elsif (a >= -536870912) and (a <= 536870911) then
      wordlength := 30;
    elsif (a >= -1073741824) and (a <= 1073741823) then
      wordlength := 31;
    elsif (a >= integer'low) and (a <= integer'high) then
      wordlength := 32;
    end if;

    return wordlength;

  end integer_wordlength;


  function next_greater_binary_power_minus_1 (a: integer) return integer is
    variable power_minus_1: integer;
  begin

    if (a >= -2) and (a <= 1) then
      power_minus_1 := 1;
    elsif (a >= -4) and (a <= 3) then
      power_minus_1 := 3;
    elsif (a >= -8) and (a <= 7) then
      power_minus_1 := 7;
    elsif (a >= -16) and (a <= 15) then
      power_minus_1 := 15;
    elsif (a >= -32) and (a <= 31) then
      power_minus_1 := 31;
    elsif (a >= -64) and (a <= 63) then
      power_minus_1 := 63;
    elsif (a >= -128) and (a <= 127) then
      power_minus_1 := 127;
    elsif (a >= -256) and (a <= 255) then
      power_minus_1 := 255;
    elsif (a >= -512) and (a <= 511) then
      power_minus_1 := 511;
    elsif (a >= -1024) and (a <= 1023) then
      power_minus_1 := 1023;
    elsif (a >= -2048) and (a <= 2047) then
      power_minus_1 := 2047;
    elsif (a >= -4096) and (a <= 4095) then
      power_minus_1 := 4095;
    elsif (a >= -8192) and (a <= 8191) then
      power_minus_1 := 8191;
    elsif (a >= -16384) and (a <= 16383) then
      power_minus_1 := 16383;
    elsif (a >= -32768) and (a <= 32767) then
      power_minus_1 := 32767;
    elsif (a >= -65536) and (a <= 65535) then
      power_minus_1 := 65535;
    elsif (a >= -131072) and (a <= 131071) then
      power_minus_1 := 131071;
    elsif (a >= -262144) and (a <= 262143) then
      power_minus_1 := 262143;
    elsif (a >= -524288) and (a <= 524287) then
      power_minus_1 := 524287;
    elsif (a >= -1048576) and (a <= 1048575) then
      power_minus_1 := 1048575;
    elsif (a >= -2097152) and (a <= 2097151) then
      power_minus_1 := 2097151;
    elsif (a >= -4194304) and (a <= 4194303) then
      power_minus_1 := 4194303;
    elsif (a >= -8388608) and (a <= 8388607) then
      power_minus_1 := 8388607;
    elsif (a >= -16777216) and (a <= 16777215) then
      power_minus_1 := 16777215;
    elsif (a >= -33554432) and (a <= 33554431) then
      power_minus_1 := 33554431;
    elsif (a >= -67108864) and (a <= 67108863) then
      power_minus_1 := 67108863;
    elsif (a >= -134217728) and (a <= 134217727) then
      power_minus_1 := 134217727;
    elsif (a >= -268435456) and (a <= 268435455) then
      power_minus_1 := 268435455;
    elsif (a >= -536870912) and (a <= 536870911) then
      power_minus_1 := 536870911;
    elsif (a >= -1073741824) and (a <= 1073741823) then
      power_minus_1 := 1073741823;
    elsif (a >= integer'low) and (a <= integer'high) then
      power_minus_1 := 2147483647;
    end if;

    return power_minus_1;

  end next_greater_binary_power_minus_1;

  function abs_wordlength (a: twos_complement) return integer is
    variable any_1s: std_ulogic;
    variable y: integer;
  begin

    any_1s := '0';

    for i in 0 to a'length-2 loop
      any_1s := a(i) or any_1s;
    end loop;

    if ((a(a'length-1) = '1') and (any_1s = '0')) then
      y := a'length + 1;
    else
      y := a'length;
    end if;

    return y;

  end abs_wordlength;

end generic_functions;
