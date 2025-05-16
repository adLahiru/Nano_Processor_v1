----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 08:00:07 PM
-- Design Name: 
-- Module Name: MUX_8_way_4_bit - Behavioral
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

entity MUX_8_way_4_bit is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_way_4_bit;

architecture Behavioral of MUX_8_way_4_bit is


type instru_array is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);

begin

process(S)
begin
    case S is
        when "000" => Y <= I0;
        when "001" => Y <= I1;
        when "010" => Y <= I2;
        when "011" => Y <= I3;
        when "100" => Y <= I4;
        when "101" => Y <= I5;
        when "110" => Y <= I6;
        when "111" => Y <= I7;
        when others => Y <= (others => '0'); -- default case
    end case;
end process;




end Behavioral;
