----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 01:42:42 PM
-- Design Name: 
-- Module Name: TB_Add_Sub - Behavioral
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

entity TB_Add_Sub is
--  Port ( );
end TB_Add_Sub;

architecture Behavioral of TB_Add_Sub is

component Add_Sub
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sign : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end component;

    
    signal Sign, Zero, Overflow: STD_LOGIC;
    signal A,B,S: STD_LOGIC_VECTOR(3 downto 0);
    
begin
 UUT: Add_Sub 
    PORT MAP(
       A => A,
       B => B,
       Sign => Sign,
       S => S,
       Zero => Zero,
       Overflow => Overflow);
   
             
    process 
    begin
        
        Sign <= '0';            
        A <= "0111";
        B <= "0110";
        WAIT for 20ns;
        

        B <= "0001";           
        WAIT for 20ns;
        
        Sign <= '1';
        A <= "0110";
        B <= "0111";
        WAIT for 20ns;
        
        A <= "0101";
        B <= "0101";
        WAIT for 20ns;
        
        A <= "0100";
        B <= "0011";
        WAIT for 20ns;
        
        Sign <= '0';
        A <= "0011";
        WAIT for 20ns;


        A <= "0010";
        wait for 20 ns;
        
        Sign <= '1';
        A <= "0000";
        B <= "0101";
        wait for 20 ns;

        Sign <= '0';
        A <= "1000";
        B <= "0001";
        wait for 20 ns;

        Sign <= '1';
        A <= "1011";
        B <= "0101";
        wait for 20 ns;
   
end process;

end Behavioral;
