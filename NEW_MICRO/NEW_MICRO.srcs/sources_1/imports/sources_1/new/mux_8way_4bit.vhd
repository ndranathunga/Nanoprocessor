----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2022 11:33:38
-- Design Name: 
-- Module Name: mux_8way_4bit - Behavioral
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

entity mux_8way_4bit is
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
end mux_8way_4bit;

architecture Behavioral of mux_8way_4bit is

begin

with RegSel select MuxOut <= D0 when "000",
                             D1 when "001",
                             D2 when "010",
                             D3 when "011",
                             D4 when "100",
                             D5 when "101",
                             D6 when "110",
                             D7 when others;
                    
end Behavioral;
