entity CarryAdder is
	port(A3,A2,A1,A0: in bit;
	     B3,B2,B1,B0,Ci: in bit;
	     S3,S2,S1,S0,Cout: out bit);
end entity;

architecture Structural of CarryAdder is

component FullAdder --add fulladder
	port( A,B,Cin: in bit;
	      S,Cout: out bit);
end component;

signal C0,C1,C2,C3,C4: bit;

begin

--first fullAdder
FA1: FullAdder
	port map(
	A =>A0,
	B =>B0,
	Cin=>C0,
	S=>S0,
	Cout=>C1);
--second fullAdder
FA2: FullAdder
	port map(
	A =>A1,
	B =>B1,
	Cin=>C1,
	S=>S1,
	Cout=>C2);
--third fullAdder
FA3: FullAdder
	port map(
	A =>A2,
	B =>B2,
	Cin=>C2,
	S=>S2,
	Cout=>C3);
--fourth fullAdder
FA4: FullAdder
	port map(
	A =>A3,
	B =>B3,
	Cin=>C3,
	S=>S3,
	Cout=>C4);

--Final Output
C0 <= Ci; 
Cout <= C4;
end architecture;