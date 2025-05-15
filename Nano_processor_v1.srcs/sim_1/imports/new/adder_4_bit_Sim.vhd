----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 05:50:26 PM
-- Design Name: 
-- Module Name: adder_4_bit_Sim - Behavioral
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

entity adder_4_bit_Sim is
--  Port ( );
end adder_4_bit_Sim;

architecture Behavioral of adder_4_bit_Sim is

component adder_4_bit
    port(
        input  : in  STD_LOGIC_VECTOR (3 downto 0);
        output : out STD_LOGIC_VECTOR (3 downto 0);
        C_out  : out STD_LOGIC
    );
end component;

signal input  : STD_LOGIC_VECTOR (3 downto 0);
signal output : STD_LOGIC_VECTOR (3 downto 0);
signal C_out  : STD_LOGIC;

begin

UUT: adder_4_bit
    port map(
        input  => input,
        output => output,
        C_out  => C_out
    );

process
begin
    input <= "1010";  -- 10 + 1 = 11
    wait for 10 ns;

    input <= "1111";  -- 15 + 1 = 0000 with carry = 1
    wait for 10 ns;

    input <= "0000";  -- 0 + 1 = 1

    wait;
end process;


end Behavioral;
