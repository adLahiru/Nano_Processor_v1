----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 09:09:00 PM
-- Design Name: 
-- Module Name: Programm_Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Programm_Rom is
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (3 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end Programm_Rom;

architecture Behavioral of Programm_Rom is

type rom_array is array (0 to 15) of STD_LOGIC_VECTOR(11 downto 0);

    constant ROM : rom_array := (
        -- Sample 6-instruction program (e.g., R1 ? 4, R2 ? 1, R1 + R2, etc.)
        "100010001100", -- 0: MOVI R1,4
        "100100000001", -- 1: MOVI R2,1
        "000011001010", -- 2: ADD R1,R2
        "011110010101", -- 3: ADD R7,R1
        "110000000101", -- 4: JZR R0,5
        "000000000000", -- 5: NOP
        -- Fill the rest with NOPs or your next process
        "000000000000", -- 6
        "000000000000", -- 7
        "000000000000", -- 8
        "000000000000", -- 9
        "000000000000", -- 10
        "000000000000", -- 11
        "000000000000", -- 12
        "000000000000", -- 13
        "000000000000", -- 14
        "000000000000"  -- 15
    );

begin

Instruction_Bus <= ROM(to_integer(unsigned(Mem_Sel)));


end Behavioral;
