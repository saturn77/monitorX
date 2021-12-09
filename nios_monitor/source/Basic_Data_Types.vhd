library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

package Basic_Data_Types is 

/*--------------------------------------------
   Intended for each of use on port lists
   and in main aspects of design
   compactness for std_logic_vector()
---------------------------------------------*/
subtype slv2  is std_logic_vector( 1 downto 0);
subtype slv3  is std_logic_vector( 2 downto 0);
subtype slv4  is std_logic_vector( 3 downto 0);
subtype slv5  is std_logic_vector( 4 downto 0);
subtype slv6  is std_logic_vector( 5 downto 0);
subtype slv7  is std_logic_vector( 6 downto 0);
subtype slv8  is std_logic_vector( 7 downto 0);
subtype slv9  is std_logic_vector( 8 downto 0);
subtype slv10 is std_logic_vector( 9 downto 0);
subtype slv11 is std_logic_vector(10 downto 0);
subtype slv12 is std_logic_vector(11 downto 0);
subtype slv13 is std_logic_vector(12 downto 0);
subtype slv14 is std_logic_vector(13 downto 0);
subtype slv15 is std_logic_vector(14 downto 0);
subtype slv16 is std_logic_vector(15 downto 0);
subtype slv17 is std_logic_vector(16 downto 0);
subtype slv18 is std_logic_vector(17 downto 0);
subtype slv19 is std_logic_vector(18 downto 0);
subtype slv20 is std_logic_vector(19 downto 0);
subtype slv21 is std_logic_vector(20 downto 0);
subtype slv22 is std_logic_vector(21 downto 0);
subtype slv23 is std_logic_vector(22 downto 0);
subtype slv24 is std_logic_vector(23 downto 0);
subtype slv25 is std_logic_vector(24 downto 0);
subtype slv26 is std_logic_vector(25 downto 0);
subtype slv27 is std_logic_vector(26 downto 0);
subtype slv28 is std_logic_vector(27 downto 0);
subtype slv29 is std_logic_vector(28 downto 0);
subtype slv30 is std_logic_vector(29 downto 0);
subtype slv31 is std_logic_vector(30 downto 0);
subtype slv32 is std_logic_vector(31 downto 0);
subtype slv48 is std_logic_vector(47 downto 0); 
subtype slv64 is std_logic_vector(63 downto 0); 

subtype svc4  is signed( 3 downto 0);
subtype svc5  is signed( 4 downto 0);
subtype svc6  is signed( 5 downto 0);
subtype svc7  is signed( 6 downto 0);
subtype svc8  is signed( 7 downto 0);
subtype svc9  is signed( 8 downto 0);
subtype svc10 is signed( 9 downto 0);
subtype svc11 is signed(10 downto 0);
subtype svc12 is signed(11 downto 0);
subtype svc13 is signed(12 downto 0);
subtype svc14 is signed(13 downto 0);
subtype svc15 is signed(14 downto 0);
subtype svc16 is signed(15 downto 0);
subtype svc17 is signed(16 downto 0);
subtype svc18 is signed(17 downto 0);
subtype svc19 is signed(18 downto 0);
subtype svc20 is signed(19 downto 0);
subtype svc21 is signed(20 downto 0);
subtype svc22 is signed(21 downto 0);
subtype svc23 is signed(22 downto 0);
subtype svc24 is signed(23 downto 0);
subtype svc25 is signed(24 downto 0);
subtype svc26 is signed(25 downto 0);
subtype svc27 is signed(26 downto 0);
subtype svc28 is signed(27 downto 0);
subtype svc29 is signed(28 downto 0);
subtype svc30 is signed(29 downto 0);
subtype svc31 is signed(30 downto 0);
subtype svc32 is signed(31 downto 0);

subtype uvc2  is unsigned( 1 downto 0);
subtype uvc3  is unsigned( 2 downto 0);
subtype uvc4  is unsigned( 3 downto 0);
subtype uvc5  is unsigned( 4 downto 0);
subtype uvc6  is unsigned( 5 downto 0);
subtype uvc7  is unsigned( 6 downto 0);
subtype uvc8  is unsigned( 7 downto 0);
subtype uvc9  is unsigned( 8 downto 0);
subtype uvc10 is unsigned( 9 downto 0);
subtype uvc11 is unsigned(10 downto 0);
subtype uvc12 is unsigned(11 downto 0);
subtype uvc13 is unsigned(12 downto 0);
subtype uvc14 is unsigned(13 downto 0);
subtype uvc15 is unsigned(14 downto 0);
subtype uvc16 is unsigned(15 downto 0);
subtype uvc17 is unsigned(16 downto 0);
subtype uvc18 is unsigned(17 downto 0);
subtype uvc19 is unsigned(18 downto 0);
subtype uvc20 is unsigned(19 downto 0);
subtype uvc21 is unsigned(20 downto 0);
subtype uvc22 is unsigned(21 downto 0);
subtype uvc23 is unsigned(22 downto 0);
subtype uvc24 is unsigned(23 downto 0);
subtype uvc25 is unsigned(24 downto 0);
subtype uvc26 is unsigned(25 downto 0);
subtype uvc27 is unsigned(26 downto 0);
subtype uvc28 is unsigned(27 downto 0);
subtype uvc29 is unsigned(28 downto 0);
subtype uvc30 is unsigned(29 downto 0);
subtype uvc31 is unsigned(30 downto 0);
subtype uvc32 is unsigned(31 downto 0);


type three_phase_set is array(2 downto 0) of svc16; 

--type abc_t is record 
--	A : svc16; 
--	B : svc16; 
--	C : svc16; 
--end record; 
--
--type abc_slv_t is record 
--	A: slv16; 
--	B: slv16;
--	C: slv16;
--	end record; 
--
--type adc_sense_t is record 
--	volt : abc_t;
--	curr : abc_t; 
--end record; 
--
--type adc_sense_slv_t is record 
--	volt : abc_slv_t; 
--	curr : abc_slv_t; 
--	end record; 

end Basic_Data_Types;