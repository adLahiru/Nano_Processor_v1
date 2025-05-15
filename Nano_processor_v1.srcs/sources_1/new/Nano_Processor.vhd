----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 10:12:19 PM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
            Output : out STD_LOGIC_vector(3 downto 0);
           Zero : out STD_LOGIC;
          Overflow : out STD_LOGIC;
          Slow_Clk_LED : out std_logic
);
end Nano_Processor;

architecture Behavioral of Nano_Processor is

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

component Instruction_Decoder 
    Port ( Instruction_Data : in STD_LOGIC_VECTOR (11 downto 0);
           Jmp_Flag : out STD_LOGIC;
           Jmp_Adrs : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Val_Sel : out STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Ope_Sele : out STD_LOGIC;
           Che_Jmp : in STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sign : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end component;

component adder_4_bit
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;

component Program_Counter 
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clk 
    Port (
       Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component MUX_2_way_4_bit 
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_8_way_4_bit 
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Programm_Rom
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (3 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

    signal Clk_out : STD_LOGIC;
    signal Reg_Sel : STD_LOGIC_VECTOR (2 downto 0);
    signal Data : STD_LOGIC_VECTOR (3 downto 0);
    signal Res , Ope_Sele : STD_LOGIC;
    signal Reg_0, Reg_1, Reg_2, Reg_3, Reg_4, Reg_5, Reg_6, Reg_7 : STD_LOGIC_VECTOR (3 downto 0);
    signal Jmp_Flag : STD_LOGIC;
    signal Jmp_Adrs : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_Sel_A,Reg_Sel_B : STD_LOGIC_VECTOR (2 downto 0);
    signal Val_Sel : STD_LOGIC;
    signal Data_Out : STD_LOGIC_VECTOR (3 downto 0);
--    signal Reg_Sel_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_En : STD_LOGIC_VECTOR (2 downto 0);
    signal Ope_Sel : STD_LOGIC;
    signal Che_Jmp : STD_LOGIC_VECTOR (3 downto 0);
    signal A, B : STD_LOGIC_VECTOR (3 downto 0);
    signal Sign : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR (3 downto 0);
--    signal Zero : STD_LOGIC;
--    signal OverFlow : STD_LOGIC;
    signal adder_out : STD_LOGIC_VECTOR (3 downto 0);
    signal C_out : STD_LOGIC;
    signal D : STD_LOGIC_VECTOR (3 downto 0);
    signal Q : STD_LOGIC_VECTOR (3 downto 0);
    signal Mem_Sel : STD_LOGIC_VECTOR (3 downto 0);
    signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);

begin

Slow_Clock_0 : Slow_Clk
    PORT MAP(
    Clk_in => Clk,
    Clk_out => Clk_out);
    
Slow_Clk_LED <= Clk_out;

Register_Bank_0 : Register_Bank Port map  ( 
               Reg_En => Reg_En,
               Data => Data,
               Clk => Clk_out,
               Res => Res,
               Reg_0 => Reg_0,
               Reg_1 => Reg_1,
               Reg_2 => Reg_2,
               Reg_3 => Reg_3,
               Reg_4 => Reg_4,
               Reg_5 => Reg_5,
               Reg_6 => Reg_6,
               Reg_7 => Reg_7 );

Instruction_Decoder_0 : Instruction_Decoder Port map (
               Instruction_Data => Instruction_Bus,
               Jmp_Flag => Jmp_Flag,
               Jmp_Adrs => Jmp_Adrs,
               Reg_Sel_1 => Reg_Sel_A,
               Val_Sel => Val_Sel,
               Data_Out => Data_Out,
               Reg_Sel_2 => Reg_Sel_B,
               Reg_En => Reg_En,
               Ope_Sele => Ope_Sele,
               Che_Jmp => A);

Add_Sub_0 : Add_Sub Port map (
               A => A,
               B => B,
               Sign => Ope_Sele,
               S => S,
               Zero => Zero,
               OverFlow => OverFlow);

Adder_4_Bit_0 : adder_4_bit Port map (
               input => Reg_1,
               output => adder_out,
               C_out => C_out);

Program_Counter_0 : Program_Counter Port map (
               D => D,
               Clk => Clk_out,
               Res => Res,
               Q => Q);

Programm_Rom_0 : Programm_Rom Port map (
               Mem_Sel => Q,
               Instruction_Bus => Instruction_Bus);

MUX_2_Way_4_Bit_0 : MUX_2_way_4_bit Port map ( 
                I0 => adder_out,
                I1 => Jmp_Adrs,
                S => Jmp_Flag,
                Y => D );
                
MUX_2_Way_4_Bit_LD_SEL : MUX_2_way_4_bit Port map ( 
                    I0 => S,
                    I1 => Data_out,
                    S => Val_Sel,
                    Y => Data );                

MUX_8_Way_4_Bit_A : MUX_8_way_4_bit Port map ( 
                I0 => Reg_0, I1 => Reg_1,
                I2 => Reg_2, I3 => Reg_3,
                I4 => Reg_4, I5 => Reg_5,
                I6 => Reg_6, I7 => Reg_7,
                S => Reg_Sel_A, Y => A );
                
MUX_8_Way_4_Bit_B : MUX_8_way_4_bit Port map ( 
                        I0 => Reg_0, I1 => Reg_1,
                        I2 => Reg_2, I3 => Reg_3,
                        I4 => Reg_4, I5 => Reg_5,
                        I6 => Reg_6, I7 => Reg_7,
                        S => Reg_Sel_B, Y => B );                
                   
output <= S;      

end Behavioral;
