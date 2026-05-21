entity BCD_Adder_TB is
end entity;
architecture bench of BCD_Adder_TB is
component BCD_Adder
        port (
        A3, A2, A1, A0 : in bit;
        B3, B2, B1, B0, Ci : in bit;
        S3, S2, S1, S0, Cout : out bit
        );
    end component;

signal A3_TB, A2_TB, A1_TB, A0_TB : bit;
signal B3_TB, B2_TB, B1_TB, B0_TB : bit;
signal Ci_TB : bit;

signal S3_TB, S2_TB, S1_TB, S0_TB : bit;
signal Cout_TB : bit;

begin
DUT1: BCD_Adder
	port map (
            A3 => A3_TB,
            A2 => A2_TB,
            A1 => A1_TB,
            A0 => A0_TB,

            B3 => B3_TB,
            B2 => B2_TB,
            B1 => B1_TB,
            B0 => B0_TB,

            Ci => Ci_TB,

            S3 => S3_TB,
            S2 => S2_TB,
            S1 => S1_TB,
            S0 => S0_TB,

            Cout => Cout_TB
	    );

    stimulus: process
    begin

        -- Test 1: 0 + 0 = 0
        -- A = 0000, B = 0000, Ci = 0
        A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '0'; A0_TB <= '0';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '0';
        Ci_TB <= '0';
        wait for 10 ns;

        -- Test 2: 2 + 3 = 5
        -- A = 0010, B = 0011, Ci = 0
        A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '1'; A0_TB <= '0';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '1'; B0_TB <= '1';
        Ci_TB <= '0';
        wait for 10 ns;

        -- Test 3: 4 + 5 = 9
        -- A = 0100, B = 0101, Ci = 0
        A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '0'; A0_TB <= '0';
        B3_TB <= '0'; B2_TB <= '1'; B1_TB <= '0'; B0_TB <= '1';
        Ci_TB <= '0';
        wait for 10 ns;

        -- Test 4: 7 + 8 = 15
        -- A = 0111, B = 1000, Ci = 0
        A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1';
        B3_TB <= '1'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '0';
        Ci_TB <= '0';
        wait for 10 ns;

        -- Test 5: 9 + 0 + Ci = 10
        -- A = 1001, B = 0000, Ci = 1
        A3_TB <= '1'; A2_TB <= '0'; A1_TB <= '0'; A0_TB <= '1';
        B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '0';
        Ci_TB <= '1';
        wait for 10 ns;
        wait;

    end process;

end architecture;
