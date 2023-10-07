----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 09:58:06 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           to_led : out STD_LOGIC_VECTOR (3 downto 0);
           to_7_seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component Instruction_Decoder
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
end component;

component ProgramROM
    Port ( MemSelect : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component RegBank
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           DataBus0 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus1 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus2 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus3 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus4 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus5 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus6 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

component Counter
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D: in STD_LOGIC_VECTOR(2 downto 0);
           Q : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component RCA_S
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CTR_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC);
end component;

component RCA
    Port (Y : in STD_LOGIC_VECTOR (2 downto 0);
          S : out STD_LOGIC_VECTOR (2 downto 0);
          Cin : in STD_LOGIC;
          Cout : out STD_LOGIC);
end component;

component mux_2way_3bit
    Port ( JmpAddress : in STD_LOGIC_VECTOR (2 downto 0);
           NextAddress : in STD_LOGIC_VECTOR (2 downto 0);
           JmpFlag : in STD_LOGIC;
           MuxOut : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component mux_8way_4bit
    Port ( RegSel : in STD_LOGIC_VECTOR (2 downto 0);
           MuxOut : out STD_LOGIC_VECTOR (3 downto 0);
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux_LoadSelect
    Port ( LoadSel : in STD_LOGIC;
           AUresult : in STD_LOGIC_VECTOR (3 downto 0);
           ImmediateVal : in STD_LOGIC_VECTOR (3 downto 0);
           MuxOut : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

--Signals
signal Instruction_Bus: std_logic_vector (11 downto 0);
signal reg_check_jump, imm_val, from_asUnit, to_reg_bank: std_logic_vector (3 downto 0);
signal addr_to_jump, reg_select0, reg_select1, reg_enable, memory_select, to_pc, from_rca: std_logic_vector (2 downto 0);
signal jump_flag, add_sub_sel, load_selector, slw_clk, RCA_Overflow: std_logic;

signal dbus0, dbus1, dbus2, dbus3, dbus4, dbus5, dbus6, dbus7: std_logic_vector (3 downto 0);
signal to_asUnit_0, to_asUnit_1: std_logic_vector (3 downto 0);

begin

Instruction_Decoder_0: Instruction_decoder
    PORT MAP(
        instruction => Instruction_Bus,
        jmp_flag => jump_flag,
        jmp_address => addr_to_jump,
        sub_sel => add_sub_sel,
        load_sel => load_selector,
        im_val => imm_val,
        reg_sel_0 => reg_select0,
        reg_sel_1 => reg_select1,
        reg_en => reg_enable,
        reg_jump => reg_check_jump
    );

programROM_0: ProgramROM
    PORT MAP(
        MemSelect => memory_select,
        I => Instruction_Bus
    );

program_counter: Counter
    PORT MAP(
        Clk => slw_clk,
        Reset => Reset,
        D => to_pc,
        Q => memory_select
    );

Rca_0: RCA
    PORT MAP(
        Y => memory_select,
        S => from_rca,
        Cin => '0',
        Cout => RCA_Overflow
    );

mux_2_3: mux_2way_3bit
    PORT MAP(
        JmpAddress => addr_to_jump,
        NextAddress => from_rca,
        JmpFlag => jump_flag,
        MuxOut => to_pc
    );

muw0: mux_LoadSelect
    PORT MAP(
        LoadSel => load_selector,
        AUresult => from_asUnit,
        ImmediateVal => imm_val,
        MuxOut => to_reg_bank
    );

reg_bank: RegBank
    PORT MAP(
        Clk => slw_clk,
        Reset => Reset,
        RegEn => reg_enable,
        DataIn => to_reg_bank,
        DataBus0 => dbus0, 
        DataBus1 => dbus1, 
        DataBus2 => dbus2, 
        DataBus3 => dbus3, 
        DataBus4 => dbus4, 
        DataBus5 => dbus5, 
        DataBus6 => dbus6, 
        DataBus7 => dbus7
    );

mux_8_4_0: mux_8way_4bit
    PORT MAP(
        RegSel => reg_select0,
        MuxOut => to_asUnit_1,
        D0 => dbus0,
        D1 => dbus1,
        D2 => dbus2,
        D3 => dbus3,
        D4 => dbus4,
        D5 => dbus5,
        D6 => dbus6,
        D7 => dbus7
    );

mux_8_4_1: mux_8way_4bit
PORT MAP(
     RegSel => reg_select1,
     MuxOut => to_asUnit_0,
     D0 => dbus0,
     D1 => dbus1,
     D2 => dbus2,
     D3 => dbus3,
     D4 => dbus4,
     D5 => dbus5,
     D6 => dbus6,
     D7 => dbus7
 );
 
 rca_s_0: RCA_S
    PORT MAP(
        A => to_asUnit_0,
        B => to_asUnit_1,
        CTR_in => add_sub_sel,
        C_out => Overflow,
        S => from_asUnit,
        Zero => Zero
    );

lut_16_7_0: LUT_16_7
    PORT MAP(
        address => dbus7,
        data => to_7_seg
    );

slow_clk_0: Slow_Clk
    PORT MAP(
        Clk_in => Clock,
        Clk_out => slw_clk
    );

reg_check_jump <= to_asUnit_1;
to_led <= dbus7;
anode <= "1110";

end Behavioral;
