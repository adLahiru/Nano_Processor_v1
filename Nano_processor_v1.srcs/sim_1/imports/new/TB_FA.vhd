----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 01:37:54 PM
-- Design Name: 
-- Module Name: TB_FA - Behavioral
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

entity TB_FA is
--  Port ( );
end TB_FA;

architecture Behavioral of TB_FA is
    component FA
        port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S : out STD_LOGIC;
               C_out : out STD_LOGIC);
    end component;
    
    signal a, b, carry_in, sum, carry_out : STD_LOGIC; 

begin

UUT : FA 
    PORT MAP(
        A => a,
        B => b,
        C_in => carry_in,
        S => sum,
        C_out => carry_out);
    
process 
    begin
        carry_in <= '0';
        a <= '0';
        b <= '0';
        WAIT FOR 100ns;
        
        b <= '1';
        WAIT FOR 100ns;
        
        a <= '1';
        WAIT FOR 100ns;

        b <= '0';
        WAIT FOR 100ns;        
        
        carry_in <= '1';
        WAIT FOR 100ns;

        b <= '1';
        WAIT FOR 100ns;
        
        a <= '0';
        WAIT FOR 100ns;

        b <= '0';
        WAIT;        
        
    
end process;


end Behavioral;
