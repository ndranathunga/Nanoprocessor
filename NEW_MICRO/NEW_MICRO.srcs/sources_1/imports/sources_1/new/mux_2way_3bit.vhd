----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2022 11:34:34
-- Design Name: 
-- Module Name: mux_2way_3bit - Behavioral
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

entity mux_2way_3bit is
    Port ( JmpAddress : in STD_LOGIC_VECTOR (2 downto 0);
           NextAddress : in STD_LOGIC_VECTOR (2 downto 0);
           JmpFlag : in STD_LOGIC;
           MuxOut : out STD_LOGIC_VECTOR (2 downto 0));
end mux_2way_3bit;

architecture Behavioral of mux_2way_3bit is

begin

with JmpFlag select MuxOut <= NextAddress when '0',
                              JmpAddress when '1',
                              nextaddress when others;

end Behavioral;
