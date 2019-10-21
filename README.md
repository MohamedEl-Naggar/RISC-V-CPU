# RISC-V-CPU
#Full data path of the single cycle implementation that supports only LW, SW, Add, Sub, And, OR, BEQ instructions in the RISC-V ISA without pipe-lining.
#Incrementing the program counter should be done manually using the left most switch. Also, using the 3rd and 4th switches from the left, the FPGA will display on the 16 LEDs either the control signals or one of the two halfs of the 32 bit instruction which is currently being executed.
#The memory here is read only memory which means you have to initialize your program in the inst_mem and some values that you are going to work with in the data_mem.
#The program should work on Nexys A7 FPGA board and the right most 4 switches(ssdSel) should be adjusted to show values on the 7 segment display according to the following:
a. The PC output (when ssdSel = 0000)
b. The PC+4 adder output (when ssdSel = 0001)
c. The branch target adder output (when ssdSel = 0010)
d. The PC input (when ssdSel = 0011)
e. The data read from the register file based on RS1 (when ssdSel = 0100)
f. The data read from the register file based on RS2 (when ssdSel = 0101)
g. The data provided as an input to the register file (when ssdSel = 0110)
h. The immediate generator output (when ssdSel = 0111)
i. The shift left 1 output (when ssdSel = 1000)
j. The output of the ALU 2nd source multiplexer (when ssdSel = 1001)
k. The output of the ALU (when ssdSel = 1010)
l. The memory output (when ssdSel = 1011)
