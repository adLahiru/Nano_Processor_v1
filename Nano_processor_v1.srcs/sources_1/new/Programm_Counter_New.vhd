----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2025 11:59:48 AM
-- Design Name: 
-- Module Name: Programm_Counter_New - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Programm_Counter_New is
    Port (
        Jum_Flag : in STD_LOGIC;
        Jum_Add  : in STD_LOGIC_VECTOR (2 downto 0);
        Adrs     : out STD_LOGIC_VECTOR (2 downto 0);
        Clk      : in STD_LOGIC;
        Res      : in STD_LOGIC
    );
end Programm_Counter_New;

architecture Behavioral of Programm_Counter_New is
    signal Add : unsigned(2 downto 0) := (others => '0');
begin

    process (Clk, Res)
    begin
        if Res = '1' then
            Add <= (others => '0');  -- synchronous reset
        elsif rising_edge(Clk) then
            if Jum_Flag = '1' then
                Add <= unsigned(Jum_Add);  -- Jump to new address
            else
                Add <= Add + 1;  -- Increment normally
            end if;
        end if;
    end process;

    Adrs <= std_logic_vector(Add);  -- One driver only

end Behavioral;