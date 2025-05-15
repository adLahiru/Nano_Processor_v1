----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 12:48:16 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
           
end Register_Bank;

architecture Behavioral of Register_Bank is

    component Reg 
        Port ( En : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (3 downto 0);
               Clk : in STD_LOGIC;
               Res : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Decoder_3_to_8
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    SIGNAL E : std_logic_vector (7 downto 0);
begin

  
Decoder : Decoder_3_to_8
    port map (
        I => Reg_En,
        Y => E );

Reg0 : Reg
    port map (
        En => E(0),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_0);

Reg1 : Reg
    port map (
        En => E(1),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_1);     

Reg2 : Reg
    port map (
        En => E(2),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_2);

Reg3 : Reg
    port map (
        En => E(3),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_3);

Reg4 : Reg
    port map (
        En => E(4),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_4);

Reg5 : Reg
    port map (
        En => E(5),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_5);     

Reg6 : Reg
    port map (
        En => E(6),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_6);

Reg7 : Reg
    port map (
        En => E(7),
        D => Data,
        Clk => Clk,
        Res => Res,
        Q => Reg_7);  
        
end Behavioral;
