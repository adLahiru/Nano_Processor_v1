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
            Mem_Sel : in STD_LOGIC_VECTOR (3 downto 0);
            Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;
    
    
    signal ROM_sel : STD_LOGIC_VECTOR (3 downto 0);
    signal instruction : STD_LOGIC_VECTOR (11 downto 0);
    
begin

    UUT: Programm_Rom
        Port Map (
            Mem_Sel => ROM_sel,
            Instruction_Bus => instruction
        );

process begin 
    ROM_sel<="0111"; 
    wait for 100ns; 
     
    ROM_sel<="0010"; 
    wait for 100ns; 
     
    ROM_sel<="0101"; 
    wait for 100ns; 
     
    ROM_sel<="0011"; 
    wait; 
     
end process; 

end Behavioral;
