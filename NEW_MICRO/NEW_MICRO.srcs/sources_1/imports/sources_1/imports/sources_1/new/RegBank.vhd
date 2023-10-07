----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 03:50:50 PM
-- Design Name: 
-- Module Name: RegBank - Behavioral
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

entity RegBank is
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
end RegBank;

architecture Behavioral of RegBank is

component Reg
    Port(D : in STD_LOGIC_VECTOR (3 downto 0);
        En : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal DecOut: STD_LOGIC_VECTOR (7 downto 0);

begin

dec_3_to_8_0: Decoder_3_to_8
    PORT MAP(
        EN => '1',
        I => RegEn,
        Y => DecOut
    );

reg_0: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus0,
        En => DecOut(0),
        Clk => Clk,
        reset => reset
    );

reg_1: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus1,
        En => DecOut(1),
        Clk => Clk,
        reset => reset
    );
    
reg_2: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus2,
        En => DecOut(2),
        Clk => Clk,
        reset => reset
    );
    
reg_3: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus3,
        En => DecOut(3),
        Clk => Clk,
        reset => reset
    );
    
reg_4: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus4,
        En => DecOut(4),
        Clk => Clk,
        reset => reset
    );

reg_5: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus5,
        En => DecOut(5),
        Clk => Clk,
        reset => reset
    );
    
reg_6: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus6,
        En => DecOut(6),
        Clk => Clk,
        reset => reset
    );
    
reg_7: Reg
    PORT MAP(
        D => DataIn,
        Q => DataBus7,
        En => DecOut(7),
        Clk => Clk,
        reset => reset
    );
end Behavioral;
