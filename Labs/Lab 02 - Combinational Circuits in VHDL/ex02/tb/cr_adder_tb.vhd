entity CarryAdder_TB is
end entity;

architecture bench of CarryAdder_TB is

    component CarryAdder
	port(A3,A2,A1,A0: in bit;
	     B3,B2,B1,B0,Ci: in bit;
	     S3,S2,S1,S0,Cout: out bit);
end component;
--diclare signals
signal A3_TB,A2_TB,A1_TB,A0_TB,B3_TB,B2_TB,B1_TB,B0_TB,Cin_TB,S3_TB,S2_TB,S1_TB,S0_TB,Cout_TB : bit;

begin
DUT1: CarryAdder
port map(
	A3 => A3_TB,
	A2 => A2_TB,
	A1 => A1_TB,
	A0 => A0_TB,
--------------------------
	B3 => B3_TB,
	B2 => B2_TB,
	B1 => B1_TB,
	B0 => B0_TB,
--------------------------
	S3 => S3_TB,	
	S2 => S2_TB,	
	S1 => S1_TB,	
	S0 => S0_TB,	
--------------------------
	Ci => Cin_TB,
	Cout => Cout_TB);

    stimulus: process
    begin

        -- Test 1: 0000 + 0000 + 0 , Cout = 0
        A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '0'; A0_TB <= '0';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '0';
        Cin_TB <= '0';
        wait for 10 ns;

        -- Test 2: 0001 + 0001 + 0 , Cout = 0
        A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '0'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '1';
        Cin_TB <= '0';
        wait for 10 ns;

        -- Test 3: 0011 + 0001 + 0 , Cout = 0
        A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '1';
        Cin_TB <= '0';
        wait for 10 ns;

        -- Test 4: 1111 + 0001 + 0 , Cout = 1
        A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '1';
        Cin_TB <= '0';
        wait for 10 ns;

        -- Test 5: 1111 + 1111 + 1, Cout = 1
        A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '1';
        Cin_TB <= '1';
        wait for 10 ns;

        wait;

    end process;

end architecture;