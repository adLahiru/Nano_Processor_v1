----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 11:41:59 PM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is

    component Programm_Counter_New 
    Port (
        Jum_Flag : in STD_LOGIC;
        Jum_Add  : in STD_LOGIC_VECTOR (2 downto 0);
        Adrs     : out STD_LOGIC_VECTOR (2 downto 0);
        Clk      : in STD_LOGIC;
        Res      : in STD_LOGIC
    );
end component;

signal Clk      : std_logic := '0';
signal Res      : std_logic := '0';
signal Jum_Flag : std_logic := '0';
signal Jum_Add  : std_logic_vector(2 downto 0) := "000";
signal Adrs     : std_logic_vector(2 downto 0);

-- Clock process: 20 ns period (10 ns high, 10 ns low)
constant CLK_PERIOD : time := 20 ns;

begin

-- Instantiate the Program Counter
UUT: Programm_Counter_New
    port map (
        Jum_Flag => Jum_Flag,
        Jum_Add  => Jum_Add,
        Adrs     => Adrs,
        Clk      => Clk,
        Res      => Res
    );

-- Clock generation
clk_process : process
begin
    while true loop
        Clk <= '0';
        wait for CLK_PERIOD / 2;
        Clk <= '1';
        wait for CLK_PERIOD / 2;
    end loop;
end process;

-- Stimulus process
stim_proc: process
begin
    -- Reset and start
    Res <= '1';
    wait for CLK_PERIOD;
    Res <= '0';
    wait for CLK_PERIOD;

    -- Let it increment naturally for 4 cycles
    wait for 4 * CLK_PERIOD;

    -- Test jump to address 3
    Jum_Add <= "110";
    Jum_Flag <= '1';
    wait for CLK_PERIOD;
    Jum_Flag <= '0';

    -- Let it increment again for 3 cycles
    wait for 3 * CLK_PERIOD;

    -- Jump to 111
    Jum_Add <= "111";
    Jum_Flag <= '1';
    wait for CLK_PERIOD;
    Jum_Flag <= '0';

    -- Let it increment again for 2 cycles (should wrap around to 000 if 3-bit overflow occurs)
    wait for 2 * CLK_PERIOD;

    -- Jump to 000
    Jum_Add <= "000";
    Jum_Flag <= '1';
    wait for CLK_PERIOD;
    Jum_Flag <= '0';

    -- Reset in the middle of the operation
    wait for CLK_PERIOD;
    Res <= '1';
    wait for CLK_PERIOD;
    Res <= '0';

    -- Final incrementing
    wait for 3 * CLK_PERIOD;

    -- Finish simulation
    wait;
end process;

end Behavioral;
   
