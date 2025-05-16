library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nanoprocessor_tb is
end nanoprocessor_tb;

architecture Behavioral of nanoprocessor_tb is

component Nano_Processor
    Port (
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR(3 downto 0);
        Zero : out STD_LOGIC;
        Overflow : out STD_LOGIC;
        Slow_Clk_LED : out STD_LOGIC;
        Anode : out STD_LOGIC_VECTOR ( 3 downto 0);
        Seg : out STD_LOGIC_VECTOR ( 6 downto 0)
    );
end component;

signal Clk, Res, Slow_Clk_LED, Zero, Overflow : STD_LOGIC;
signal Processor_Output, Anode  : STD_LOGIC_VECTOR(3 downto 0);
signal Seg  : STD_LOGIC_VECTOR(6 downto 0);

begin

UUT: Nano_Processor
    Port map (
        Clk => Clk,
        Res => Res,
        Output => Processor_Output,
        Zero => Zero,
        Overflow => Overflow,
        Slow_Clk_LED => Slow_Clk_LED,
        Anode => Anode,
        Seg => Seg
        
    );

-- Clock Generation
Clk_Process: process
begin
    Clk <= '0';
    wait for 5 ns;
    Clk <= '1';
    wait for 5 ns;
end process;

-- Reset Generation
Res_Process: process
begin
    Res <= '1';
    wait for 50 ns;
    Res <= '0';
    wait;
end process;

end Behavioral;
