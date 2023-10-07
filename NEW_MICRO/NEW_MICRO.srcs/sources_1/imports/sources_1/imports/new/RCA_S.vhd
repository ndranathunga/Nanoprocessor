----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 09:35:37 PM
-- Design Name: 
-- Module Name: RCA_S - Behavioral
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

entity RCA_S is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CTR_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero: out STD_LOGIC);
end RCA_S;

architecture Behavioral of RCA_S is

component ADD_SUB
     Port ( CTR : in STD_LOGIC;
           A0 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           CTR_0 : in STD_LOGIC;
           C : out STD_LOGIC;
           S0 : out STD_LOGIC);
end component;

signal C0,C1,C2,C3, overflow : STD_LOGIC;
signal AA, NEG: STD_LOGIC_VECTOR (3 downto 0);
signal ss: STD_LOGIC_VECTOR (3 downto 0);
begin

NEG <= (CTR_in, CTR_in, CTR_in, CTR_in);
AA <= A and not NEG;

ADD_SUB0 : ADD_SUB
    PORT MAP(
        CTR => CTR_in,
        A0 => AA(0),
        B0 => B(0),
        CTR_0 => CTR_in,
        C => C0,
        S0 => Ss(0)
    );

ADD_SUB1 : ADD_SUB
    PORT MAP(
        CTR => C0,
        A0 => AA(1),
        B0 => B(1),
        CTR_0 => CTR_in,
        C => C1,
        S0 => Ss(1)
    );
    
ADD_SUB2 : ADD_SUB
    PORT MAP(
        CTR => C1,
        A0 => AA(2),
        B0 => B(2),
        CTR_0 => CTR_in,
        C => C2,
        S0 => Ss(2)
    );
    
ADD_SUB3 : ADD_SUB
    PORT MAP(
        CTR => C2,
        A0 => AA(3),
        B0 => B(3),
        CTR_0 => CTR_in,
        C => C3,
        S0 => Ss(3)
    );

zero <= not Ss(0) and not ss(1) and not ss(2) and not ss(3);
overflow <= not CTR_in and (A(3) XNOR B(3)) and (A(3) XOR ss(3));
s <= ss;
C_Out <= overflow;
end Behavioral;
