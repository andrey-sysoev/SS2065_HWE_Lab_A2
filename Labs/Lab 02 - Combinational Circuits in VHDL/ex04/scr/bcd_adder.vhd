entity BCD_Adder is
	port (
        A3,A2,A1,A0: in bit;
        B3,B2,B1,B0,Ci: in bit;
        S3,S2,S1,S0,Cout: out bit
    );
end entity;
architecture Structural of BCD_Adder is
component CarryAdder --add CarryAdder
        port (
	A3,A2,A1,A0: in bit;
	B3,B2,B1,B0,Ci: in bit;
	S3,S2,S1,S0,Cout: out bit);
end component;
--------------------------------------
--add lines for sum from first adder
signal Z3,Z2,Z1,Z0: bit;
--add 1st,2nd carries line and Combinational circuit signal 
signal C1,C2,Comb: bit;
--Zero signal
signal Zero: bit:= '0';
-------------------------------------
begin
--add first 4-bit adder
ADD1: CarryAdder
	port map(
	A0 => A0,
	A1 => A1,
	A2 => A2,
	A3 => A3,

	B0 => B0,
	B1 => B1,
	B2 => B2,
	B3 => B3,
	Ci => Ci,
	
	S3 => Z3,
        S2 => Z2,
        S1 => Z1,
        S0 => Z0, 
	Cout => C1
	);
--add second 4-bit adder
    ADD2: CarryAdder
        port map (
         A3 => Z3,
         A2 => Z2,
         A1 => Z1,
         A0 => Z0,

         B3 => Zero,
         B2 => Comb,
         B1 => Comb,
         B0 => Zero,
         Ci => Zero,

         S3 => S3,
         S2 => S2,
         S1 => S1,
         S0 => S0,
         Cout => C2
        );
-- Combinational logic 
-- When result > 9, Comb = 1 
Comb <= C1 or (Z3 and Z2) or (Z3 and Z1);
-- Decimal carry
    Cout <= Comb;
end architecture;










