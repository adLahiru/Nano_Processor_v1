----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 11:09:00 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
component Register_Bank
        Port ( Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Data : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Reg_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_4 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_7 : out STD_LOGIC_VECTOR (3 downto 0));
           
end component;

    SIGNAL clk , res : std_logic;
    SIGNAL data : std_logic_vector (3 downto 0);
    SIGNAL reg_en : std_logic_vector (2 downto 0);
    SIGNAL reg_0 , reg_1, reg_2, reg_3 , reg_4, reg_5, reg_6, reg_7 : std_logic_vector (3 downto 0);
    
begin

UUT : Register_Bank 
    port map (
        Reg_En => reg_en,
        Data => data,
        Clk => clk,
        Res => res,
        Reg_0 => reg_0,
        Reg_1 => reg_1,
        Reg_2 => reg_2,
        Reg_3 => reg_3,
        Reg_4 => reg_4,
        Reg_5 => reg_5,
        Reg_6 => reg_6,
        Reg_7 => reg_7);
        
process
    begin
        clk <= '0';
        wait for 50 ns;
        
        clk <= '1';
        wait for 50ns;
end process;

process
    begin
        data <= "1010";
        res <= '0';
        reg_en <= "000";
        wait for 100ns;
        
        reg_en <= "001";
        wait for  100ns;
        
        reg_en <= "010";
        wait for  100ns;
        
        reg_en <= "011";
        wait for  100ns;
        
        reg_en <= "100";
        wait for  100ns;
        
        reg_en <= "101";
        wait for  100ns;
        
        reg_en <= "110";
        wait for  100ns;
        
        reg_en <= "111";
        wait for  100ns;
        
        res <= '1';
        wait for 100 ns;
        res <= '0';
        
        wait;
end process;

end Behavioral;
