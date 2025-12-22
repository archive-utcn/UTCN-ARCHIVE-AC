entity AND_B is
   port (A,B: in bit;
         Y: out bit);
end AND_B;	

architecture ARHITECTURA_1 of AND_B is
begin
    Y <= A and B;
end ARHITECTURA_1;
