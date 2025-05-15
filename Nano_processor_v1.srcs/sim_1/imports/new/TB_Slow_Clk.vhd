----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 12:19:28 AM
-- Design Name: 
-- Module Name: TB_Slow_Clk - Behavioral
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

entity TB_Slow_Clk is
--  Port ( );
end TB_Slow_Clk;

architecture Behavioral of TB_Slow_Clk is
    component Slow_Clk
        port (
            Clk_in : in STD_LOGIC;
            Clk_out : out STD_LOGIC);
    end component;
    
    SIGNAL clk_in : std_logic;
    SIGNAL clk_out : std_logic;
    
begin

    UUT : Slow_Clk 
        port map (
            Clk_in => clk_in,
            Clk_out => clk_out);
            
            
    process 
        begin 
            clk_in <= '0';
            
            wait for 5ns ;
            clk_in <= '1';
            
            wait for 5ns ;
            clk_in <= '0';
            
    end process;

end Behavioral;
