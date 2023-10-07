----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 10:46:07 AM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( instruction : in STD_LOGIC_VECTOR (11 downto 0);
           reg_jump : in STD_LOGIC_VECTOR (3 downto 0);
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           im_val : out STD_LOGIC_VECTOR (3 downto 0);
           reg_sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
           reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           sub_sel : out STD_LOGIC;
           jmp_flag : out STD_LOGIC;
           jmp_address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component;

component Tri_state_buffer3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC);
end component;

signal ADD, MOVI, NEG, JZR: STD_LOGIC;
signal ADD_NEG, ADD_NEG_JZR: STD_LOGIC;
signal reg_sel_0_activate, reg_sel_1_activate: STD_LOGIC_VECTOR (2 downto 0);

begin

Decoder_2_to_4_0: Decoder_2_to_4
    PORT MAP(
        I => instruction(11 downto 10),
        EN => '1',
        Y(3) => ADD,
        Y(2) => MOVI,
        Y(1) => NEG,
        Y(0) => JZR
    );

reg_en <= instruction(9 downto 7);
load_sel <= not MOVI;
im_val <= instruction(3 downto 0);

ADD_NEG <= ADD or NEG;
ADD_NEG_JZR <= ADD_NEG or JZR;

reg_sel_1_activate <= (ADD_NEG, ADD_NEG, ADD_NEG);
reg_sel_0_activate <= (ADD_NEG_JZR, ADD_NEG_JZR, ADD_NEG_JZR);

reg_sel_0 <= instruction(9 downto 7) and reg_sel_0_activate;
reg_sel_1 <= instruction(6 downto 4) and reg_sel_1_activate;

sub_sel <= NEG;

jmp_flag <= JZR and not(reg_jump(0) or reg_jump(1) or reg_jump(2) or reg_jump(3));
jmp_address <= instruction(2 downto 0);

end Behavioral;
