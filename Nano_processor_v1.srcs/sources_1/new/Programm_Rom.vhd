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
    "100010001100", -- 0: MOVI R1, 12       ; R1 ? 12
    "100100000001", -- 1: MOVI R2, 1        ; R2 ? 1
    "000011001010", -- 2: ADD R1, R2        ; R1 ? R1 + R2 (13)
    "011110010101", -- 3: ADD R7, R1        ; R7 ? R7 + R1 (13)
    "110000000101", -- 4: JZR R0, 5         ; If R0 == 0 ? jump to 5
    "000000000000", -- 5: NOP
    "100110000011", -- 6: MOVI R3, 3        ; R3 ? 3
    "010110000000", -- 7: NEG R3            ; R3 ? -3 (2's complement)
    "100001000101", -- 8: MOVI R0, 5        ; R0 ? 5
    "110000000111", -- 9: JZR R0, 7         ; Not taken (R0 ? 0)
    "100000001111", --10: MOVI R0, 15       ; R0 ? 15
    "010000000000", --11: NEG R0            ; R0 ? -15
    "110000001100", --12: JZR R0, 12        ; Not taken (R0 ? 0)
    "100101000001", --13: MOVI R2, 1        ; R2 ? 1
    "000011010010", --14: ADD R1, R2        ; R1 ? R1 + R2
    "110010000011"  --15: JZR R1, 3         ; Jump if R1 == 0 ? unlikely
);


begin

Instruction_Bus <= ROM(to_integer(unsigned(Mem_Sel)));


end Behavioral;
