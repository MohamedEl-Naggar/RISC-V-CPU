`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 02:34:23 PM
// Design Name: 
// Module Name: DataMem_h
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


module DataMem_h
 (input clk, input MemRead, input MemWrite,
 input [5:0] addr, input [31:0] data_in, output [31:0] data_out);
 reg [31:0] mem [0:63];
 
 initial begin
  mem[0]=32'd36;
  mem[1]=32'd7;
  mem[2]=32'd22;
 end
 
 always @(posedge clk)
 begin
 if (MemWrite)
 mem[addr] <= data_in;
 end

 assign data_out = MemRead ? mem[addr]:0;
endmodule
