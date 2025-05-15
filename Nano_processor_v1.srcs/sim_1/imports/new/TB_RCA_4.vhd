----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 01:41:55 PM
-- Design Name: 
-- Module Name: TB_RCA_4 - Behavioral
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

entity TB_RCA_4 is
--  Port ( );
end TB_RCA_4;

architecture Behavioral of TB_RCA_4 is
    component RCA_4
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_vector (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_in3: out STD_LOGiC;
           C_out : out STD_LOGIC);
     end component;
     signal a, b, s: STD_LOGIC_VECTOR(3 downto 0);
     signal carry_in, carry_in3, carry_out: STD_LOGIC;

begin

UUT: RCA_4 
    PORT MAP(
        A => a,
        B => b,
        C_in => carry_in,
        S => s,
        C_in3 => carry_in3,
        C_out => carry_out);


process
    begin 
        
        carry_in <= '0';
        a <= "1110";
        b <= "0100";
        WAIT FOR 100ns;
        
        b <= "0101";
        WAIT FOR 100ns;
        
        b <= "1000";
        WAIT FOR 100ns;
        
        carry_in <= '1';
        a <= "1110";
        b <= "0100";
        WAIT FOR 100ns;
        
        b <= "0101";
        WAIT FOR 100ns;
        
        b <= "1000";
        WAIT FOR 100ns;
        
        a <= "0110";
        b <= "0000";
        WAIT FOR 100ns;
        
        b <= "0011";
        WAIT FOR 100ns;
        
        b <= "1000";
        WAIT FOR 100ns;
        
        carry_in <= '0';
        a <= "0110";
        b <= "0000";
        WAIT FOR 100ns;
        
        b <= "0011";
        WAIT FOR 100ns;
        
        b <= "1000";
        WAIT for 100ns;
        
        
end process;         
        

end Behavioral;
