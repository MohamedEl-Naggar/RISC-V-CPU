`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 02:33:31 PM
// Design Name: 
// Module Name: InstMem_h
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstMem_h (input [5:0] addr, output [31:0] data_out);
 reg [31:0] mem [0:63];
 initial begin
  mem[0]=32'b00000000000000000010100100000011;
  mem[1]=32'b00000000010000000010010010000011;
  mem[2]=32'b00000000100000000010100110000011;
  mem[3]=32'b00000001001101001000010010110011;
  mem[4]=32'b00000001001001001000010001100011;
  mem[5]=32'b11111110000000000000110011100011;
 end
 assign data_out = mem[addr];
endmodule
