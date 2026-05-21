entity CR_Add_Sub is
	port(A3,A2,A1,A0: in bit;
	     B3,B2,B1,B0,CTR: in bit;
	     S3,S2,S1,S0,Cout: out bit);
end entity;

architecture Structural of CR_Add_Sub is

component CarryAdder -- add CarryAdder
        port (
            A3, A2, A1, A0 : in bit;
            B3, B2, B1, B0, Ci : in bit;
            S3, S2, S1, S0, Cout : out bit
        );
    end component;

 signal B_3, B_2, B_1, B_0 : bit; -- output signals

begin

CA1: CarryAdder --assign 
	port map(
	A0 => A0,
	A1 => A1,
	A2 => A2,
	A3 => A3,
	
	B3 => B_3,
        B2 => B_2,
        B1 => B_1,
        B0 => B_0,

	S3 => S3,
        S2 => S2,
        S1 => S1,
        S0 => S0,

	Ci =>CTR,
	Cout =>Cout);

-- If CTR = 0, B_x = B
-- If CTR = 1, B_x = not B
B_0 <= B0 xor CTR;
B_1 <= B1 xor CTR;
B_2 <= B2 xor CTR;
B_3 <= B3 xor CTR;
end architecture;