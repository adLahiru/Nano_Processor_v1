----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 08:56:12 PM
-- Design Name: 
-- Module Name: MUX_8_way_4_bit_tb - Behavioral
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

entity MUX_8_way_4_bit_tb is
--  Port ( );
end MUX_8_way_4_bit_tb;

architecture Behavioral of MUX_8_way_4_bit_tb is

-- Component declaration of the MUX under test (DUT)
COMPONENT MUX_8_way_4_bit 
        PORT(   I0,I1,I2,I3,I4,I5,I6,I7 : in STD_LOGIC_VECTOR (3 downto 0); 
                S : in std_logic_vector (2 downto 0); 
                Y    : out STD_LOGIC_VECTOR (3 downto 0)); 
END COMPONENT; 

-- Signal declarations for inputs, select, and output
signal I0,I1,I2,I3,I4,I5,I6,I7,Y : STD_LOGIC_VECTOR (3 downto 0); 
signal S : std_logic_vector (2 downto 0); 

begin
-- Instantiate the Unit Under Test (UUT)
UUT: MUX_8_way_4_bit PORT MAP( 
    I0 => I0,  
    I1 => I1,  
    I2 => I2, 
    I3 => I3,  
    I4 => I4,  
    I5 => I5, 
    I6 => I6,  
    I7 => I7,  
    S => S,  
    Y => Y
); 

-- Test process
process
begin

    -- Assign static values to all 8 inputs
    I0 <= "0000";
    I1 <= "0001";
    I2 <= "0010";
    I3 <= "0011";
    I4 <= "0100";
    I5 <= "0101";
    I6 <= "0110";
    I7 <= "0111";
    
    -- Apply all 8 select combinations sequentially
    S <= "000";
    WAIT FOR 100 NS;
    S <= "001";
    WAIT FOR 100 NS;
    S <= "010";
    WAIT FOR 100 NS;
    S <= "011";
    WAIT FOR 100 NS;    
    S <= "100";
    WAIT FOR 100 NS;
    S <= "101";
    WAIT FOR 100 NS;
    S <= "110";
    WAIT FOR 100 NS;
    S <= "111";
    WAIT;
    





end process;



end Behavioral;
