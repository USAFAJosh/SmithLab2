----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2026 02:15:56 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
--none
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

component sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end component;

    signal w_in   : std_logic_vector(3 downto 0);
    signal w_out  : std_logic_vector(6 downto 0); 

begin

sevenseg_decoder_uut: sevenseg_decoder
    port map (
        i_Hex(3 downto 0) => w_in(3 downto 0),
        o_seg_n(6 downto 0) => w_out(6 downto 0)
    );
    
    test_process : process 
	begin
    
    w_in <= x"0"; wait for 10 ns;
    assert w_out = "1000000" report "error on 0" severity failure;
    w_in <= x"2"; wait for 10 ns;
    assert w_out = "0100100" report "error on 2" severity failure;
    w_in <= x"4"; wait for 10 ns;
    assert w_out = "0011001" report "error on 4" severity failure;
    w_in <= x"7"; wait for 10 ns;
    assert w_out = "1111000" report "error on 7" severity failure;
    w_in <= x"8"; wait for 10 ns;
    assert w_out = "0000000" report "error on 8" severity failure;
    w_in <= x"A"; wait for 10 ns;
    assert w_out = "0001000" report "error on a" severity failure;
    w_in <= x"C"; wait for 10 ns;
    assert w_out = "0100111" report "error on c" severity failure;
    w_in <= x"E"; wait for 10 ns;
    assert w_out = "0000110" report "error on e" severity failure;
    w_in <= x"F"; wait for 10 ns;
    assert w_out = "0001110" report "error on f" severity failure;
    
    wait; -- wait forever
	end process;	

end Behavioral;
