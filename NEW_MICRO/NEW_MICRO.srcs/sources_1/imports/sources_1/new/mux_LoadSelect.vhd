----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.07.2022 11:35:36
-- Design Name: 
-- Module Name: mux_LoadSelect - Behavioral
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

entity mux_LoadSelect is
    Port ( LoadSel : in STD_LOGIC;
           AUresult : in STD_LOGIC_VECTOR (3 downto 0);
           ImmediateVal : in STD_LOGIC_VECTOR (3 downto 0);
           MuxOut : out STD_LOGIC_VECTOR (3 downto 0));
end mux_LoadSelect;

architecture Behavioral of mux_LoadSelect is

begin

with LoadSel select MuxOut <= ImmediateVal when '0',
                              AUresult when '1',
                              "ZZZZ" when others;

end Behavioral;
