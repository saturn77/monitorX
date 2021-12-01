# monitorX
An example of using Nios to monitor to FPGA operations in VHDL. 

## Background 

The Nios softcore processor is instantiated inside of a Quartus design
to examine the effects of an overloaded VHDL function on a register. 
For example, Nios does the following:

 1. Writes a value to an output register
 2. This register is then converted to signed, unsigned, and std_logic_vector type
 3. The VHDL overloaded "bits" function is then applied to these three signals
 4. Nios then reads these signals back in along with the original value written

## VHDL Overloading

In general, VHDL allows for function overloading with *unique arguments* however in
this design the arguments are *not unique* for the "bits" function. So this is a 
fundamental issue with the compiler versus the VHDL specification. 

## Hardware Testbed

The highly popular DE10-Nano from Terasic was used to test the code. The logic
portion of the device was used with Nios, and the hard processor side was not
used at all. The design was synthesized with Quartus 20.1 on Windows 10. 
