----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2016 11:12:35
-- Design Name: 
-- Module Name: PWM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;

use work.Package_Counter.all;
use work.Package_PWM_Counter.all;

entity PWM is
        Generic(
        --If this is set to 1 then a minimum duty cycle is enforced.
        minimum_duty_cycle_true  : in STD_LOGIC;
        
        --These take values of 0-255, a value of 127 will be cause the corresponding LED to be on for 50% of the time
        time_on_R_1    : in integer;
        time_on_G_1    : in integer;
        time_on_B_1    : in integer;
        time_on_R_2    : in integer;
        time_on_G_2    : in integer;
        time_on_B_2    : in integer;
        time_on_R_3    : in integer;
        time_on_G_3    : in integer;
        time_on_B_3    : in integer;
        
        --Number of cycles of the clk to count through (e.g 256 kHz=390.625)
        slow_clk_length    : in integer
        );
        
        Port( 
        reset       : in STD_LOGIC;
        clk         : in STD_LOGIC;
        
        LED_R       : out STD_LOGIC_VECTOR(3 downto 0);
        LED_G       : out STD_LOGIC_VECTOR(3 downto 0);
        LED_B       : out STD_LOGIC_VECTOR(3 downto 0)
        );

end PWM;

architecture Behavioral of PWM is

    signal R_1_count_max    : integer;
    signal G_1_count_max    : integer;
    signal B_1_count_max    : integer;
    signal R_2_count_max    : integer;
    signal G_2_count_max    : integer;
    signal B_2_count_max    : integer;
    signal R_3_count_max    : integer;
    signal G_3_count_max    : integer;
    signal B_3_count_max    : integer;
    
    signal slow_clk_inc     : STD_LOGIC;
    signal slow_clk_clear   : STD_LOGIC;
    signal slow_clk_count   : STD_LOGIC;
    
begin
    
    --Reset block
    
    --End of reset block
    
    --Input assignment block
    --Assign inputs to internal signals
    R_1_count_max <= time_on_R_1;
    G_1_count_max <= time_on_G_1;
    B_1_count_max <= time_on_B_1;
    R_2_count_max <= time_on_R_2;
    G_2_count_max <= time_on_G_2;
    B_2_count_max <= time_on_B_2;
    R_3_count_max <= time_on_R_3;
    G_3_count_max <= time_on_G_3;
    B_3_count_max <= time_on_B_3;
    --End of assignment block
    
    --Create counter for each colour of each LED
    
    --Slow clock generation block
    slow_clk_proc : process(clk)
        begin
            if rising_edge(clk) then
                slow_clk_inc <= '1';            
            end if; --clk edge if
        end process slow_clk_proc;
        
        slow_clk_counter : Counter
        Generic map(Counter_size => slow_clk_length)
        port map(
            reset => reset;
            clk => clk;
            clear => slow_clk_clear;
            inc => slow_clock_inc;
            count => slow_clk_count
        );
    --End of slow clock block
    
    

end Behavioral;
