----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2025 11:52:17 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
    component Decoder_2_to_4
            Port ( En : in STD_LOGIC;
                   I : in STD_LOGIC_VECTOR (1 downto 0);
                   Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    SIGNAL En : std_logic;
    SIGNAL I : std_logic_vector (1 downto 0);
    SIGNAL Y : std_logic_vector (3 downto 0);
    
begin

    UUT : Decoder_2_to_4 port map (
        En => En,
        I => I,
        Y => Y);

    process 
        begin
            En <= '0';
            I <= "00";
            
            wait for 100ns;
            I <= "11";
            
            wait for 100 ns;
            En <= '1';
            I <= "00";
            
            wait for 100ns;
            I <= "01";
            
            wait for 100 ns;
            I <= "10";
            
            wait for 100ns;
            I <= "11";
            
            wait for 100 ns;
            En <= '0';
            wait;
    end process;
    

end Behavioral;
