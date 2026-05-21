entity FullAdder is
	port( A,B,Cin: in bit;
	      S,Cout: out bit);
end entity;

architecture Structure of FullAdder is 

component HalfAdder --add halfadder
	port( A,B: in bit;
	      S,C: out bit);
	end component;

signal C1,C2,S1,S2: bit;

begin 
--First HalfAdder
HA1: HalfAdder
	port map(
	A =>A,
	B =>B,
	C=>C1,
	S=>S1);

--Second HalfAdder
HA2: HalfAdder
	port map(
	A=>S1,
	B=>Cin,
	S=>S2,
	C=>C2);
--Final Output

S<=S2;
Cout <= C1 or C2;

end architecture;
