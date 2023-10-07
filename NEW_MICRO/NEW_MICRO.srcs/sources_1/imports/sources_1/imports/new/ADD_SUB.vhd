----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 09:14:41 PM
-- Design Name: 
-- Module Name: ADD_SUB - Behavioral
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

entity ADD_SUB is
    Port ( CTR : in STD_LOGIC;
           A0 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           CTR_0 : in STD_LOGIC;
           C : out STD_LOGIC;
           S0 : out STD_LOGIC);
end ADD_SUB;

architecture Behavioral of ADD_SUB is
component FA
    port (
     A : in STD_LOGIC;
     B : in STD_LOGIC;
     C_in : in STD_LOGIC;
     C_out : out STD_LOGIC;
     S : out STD_LOGIC
    );
end component;

signal B0_1: STD_LOGIC;

begin
FA_1 : FA
PORT MAP(
    A => A0,
    B => B0_1 ,
    C_in => CTR,
    C_out => C,
    S => S0
); 
   
    B0_1 <= CTR_0 XOR B0;

end Behavioral;
