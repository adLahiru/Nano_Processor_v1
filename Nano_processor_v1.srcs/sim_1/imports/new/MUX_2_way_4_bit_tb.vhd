----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 11:03:13 PM
-- Design Name: 
-- Module Name: MUX_2_way_4_bit_tb - Behavioral
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

entity MUX_2_way_4_bit_tb is
--  Port ( );
end MUX_2_way_4_bit_tb;

architecture Behavioral of MUX_2_way_4_bit_tb is

-- Component declaration of the MUX under test (DUT)
COMPONENT MUX_2_way_4_bit 
        PORT(   I0,I1: in STD_LOGIC_VECTOR (3 downto 0); 
                S : in std_logic; 
                Y    : out STD_LOGIC_VECTOR (3 downto 0)); 
END COMPONENT; 

-- Signal declarations for inputs, select, and output
signal I0,I1,Y : STD_LOGIC_VECTOR (3 downto 0); 
signal S : std_logic; 

begin
-- Instantiate the Unit Under Test (UUT)
UUT: MUX_2_way_4_bit PORT MAP( 
    I0 => I0,  
    I1 => I1,   
    S => S,  
    Y => Y
); 

-- Test process
process
begin

    -- Assign static values to all 2 inputs
    I0 <= "1001";
    I1 <= "0111";
    
    -- Apply all 2 select combinations sequentially
    S <= '0';
    WAIT FOR 100 NS;
    S <= '1';
    WAIT;
    





end process;



end Behavioral;
