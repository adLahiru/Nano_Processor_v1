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
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end Programm_Rom;

architecture Behavioral of Programm_Rom is


type rom_array is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);

constant ROM : rom_array := (
    "101110000011", --MOVI R7,3 
    "100010000001", --MOVI R1,1 
    "010010000000",  --NEG R1 
    "100100000011", --MOVI R2,3 
    "000100010000", --ADD R2,R1 
    "001110100000",  --ADD R7,R2 
    "110100000110",  --JZR R2,6 
    "110000000100"  -- JZR R0,4
);


begin

Instruction_Bus <= ROM(to_integer(unsigned(Mem_Sel)));


end Behavioral;
