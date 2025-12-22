Entity Adder8 is
    PORT ( A, B: IN Bit_Vector(7 Downto 0);
           Cin: IN Bit;
           S : OUT Bit_Vector(7 Downto 0);
           Cout: OUT Bit);
End; 

Entity CLA4 is
    PORT ( A, B: IN Bit_Vector(3 Downto 0);
           Cin: IN Bit;
           S: OUT Bit_Vector(3 Downto 0);
           C3: OUT Bit);
END ;  

Architecture Conc of CLA4 is
Signal P, G : Bit_Vector(3 Downto 0);
Signal C: Bit_Vector(2 Downto 0);
Begin
G <= A AND B after 2 ns;
P <= A XOR B after 2 ns;
S(0) <= P(0) XOR Cin after 2 ns;
S(1) <= P(1) XOR C(0) after 2 ns;
S(2) <= P(2) XOR C(1) after 2 ns;
S(3) <= P(3) XOR C(2) after 2 ns;
C(0) <= G(0) OR (P(0) AND Cin) after 4 ns;
C(1) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin) after 6 ns;
C(2) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin) after 8 ns;
C3 <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) and P(2) AND P(1) AND P(0) AND Cin) after 10 ns;
end;

Architecture Structural of Adder8 is
Component CLA4
   PORt ( A, B: IN Bit_Vector(3 Downto 0);
          Cin: IN Bit;
          S: OUT Bit_Vector(3 Downto 0);
          C3: OUT Bit);
END Component;		 

Signal C: Bit;
Begin
   Add1: CLA4 PORT MAP (A(3 Downto 0), B(3 Downto 0), Cin, S(3 Downto 0),C);
   Add2: CLA4 PORT MAP (A(7 Downto 4), B(7 Downto 4), C, S(7 Downto 4),Cout);
 end ;  