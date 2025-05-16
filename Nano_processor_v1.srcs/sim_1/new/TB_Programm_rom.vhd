----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 05:05:59 PM
-- Design Name: 
-- Module Name: TB_Programm_rom - Behavioral
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

entity TB_Programm_rom is
--  Port ( );
end TB_Programm_rom;

architecture Behavioral of TB_Programm_rom is
    component Programm_Rom
        Port (
            Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
            Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;
    
    signal ROM_sel : STD_LOGIC_VECTOR (2 downto 0);  -- Fixed to 3-bit
    signal instruction : STD_LOGIC_VECTOR (11 downto 0);
    
begin

    UUT: Programm_Rom
        Port Map (
            Mem_Sel => ROM_sel,
            Instruction_Bus => instruction
        );

    process 
    begin 
        ROM_sel <= "000";  -- MOVI R7,3
        wait for 100 ns;

        ROM_sel <= "001";  -- MOVI R1,1
        wait for 100 ns;

        ROM_sel <= "010";  -- NEG R1
        wait for 100 ns;

        ROM_sel <= "011";  -- MOVI R2,3
        wait for 100 ns;

        ROM_sel <= "100";  -- ADD R2,R1
        wait for 100 ns;

        ROM_sel <= "101";  -- ADD R7,R2
        wait for 100 ns;

        ROM_sel <= "110";  -- JZR R2,6
        wait for 100 ns;

        ROM_sel <= "111";  -- JZR R0,4
        wait;

    end process;

end Behavioral;