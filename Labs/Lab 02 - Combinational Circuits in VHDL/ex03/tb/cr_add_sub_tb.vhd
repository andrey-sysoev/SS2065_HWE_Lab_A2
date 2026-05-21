entity CR_Add_Sub_TB is
end entity;

architecture bench of CR_Add_Sub_TB is
component CR_Add_Sub
	port (
        A3, A2, A1, A0: in bit;
        B3, B2, B1, B0,CTR: in bit;
        S3, S2, S1, S0,Cout: out bit
        );
    end component;
    signal A3_TB, A2_TB, A1_TB, A0_TB: bit;
    signal B3_TB, B2_TB, B1_TB, B0_TB, CTR_TB: bit;
    signal S3_TB, S2_TB, S1_TB, S0_TB, Cout_TB: bit;
begin

    DUT1: CR_Add_Sub
        port map (
            A3 => A3_TB,
            A2 => A2_TB,
            A1 => A1_TB,
            A0 => A0_TB,

            B3 => B3_TB,
            B2 => B2_TB,
            B1 => B1_TB,
            B0 => B0_TB,

            CTR => CTR_TB,

            S3 => S3_TB,
            S2 => S2_TB,
            S1 => S1_TB,
            S0 => S0_TB,

            Cout => Cout_TB
        );

    stimulus: process
    begin
        -- Test 1: Addition 3 + 2 = 5
        -- A = 0011, B = 0010, CTR = 0
	-- Expected result: 0101
        A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '1'; B0_TB <= '0';
        CTR_TB <= '0';
        wait for 10 ns;

        -- Test 2: Addition 7 + 8 = 15
        -- A = 0111, B = 1000, CTR = 0
	-- Expected result: 1111
        A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '1'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '0';
        CTR_TB <= '0';
        wait for 10 ns;

        -- Test 3: Subtraction 5 - 2 = 3
        -- A = 0101, B = 0010, CTR = 1
	-- Expected result: 0011
        A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '0'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '1'; B0_TB <= '0';
        CTR_TB <= '1';
        wait for 10 ns;

        -- Test 4: Addition overflow 15 + 1 = 0, Cout = 1
        -- A = 1111, B = 0001, CTR = 0
	-- Expected result: 0000, Cout = 1
        A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '1';
        CTR_TB <= '0';
        wait for 10 ns;

        wait;

    end process;
end architecture;