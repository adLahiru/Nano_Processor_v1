----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 07:04:50 PM
-- Design Name: 
-- Module Name: Display_out - Behavioral
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

entity Display_out is
    Port ( S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           S_in : in STD_LOGIC_VECTOR (7 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Display_out;

architecture Behavioral of Display_out is

COMPONENT LUT_16_7
 Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (6 downto 0));
end COMPONENT;

begin


end Behavioral;
