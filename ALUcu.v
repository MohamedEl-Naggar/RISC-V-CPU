`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 03:14:22 PM
// Design Name: 
// Module Name: ALUcu
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


module ALUcu (input [31:0] inst, [1:0] ALUop, output [3:0] ALUsel);
    assign ALUsel = (ALUop==2'b00)? 4'b0010 : (ALUop==2'b01)? 4'b0110: (inst[14:12]==4'b111)? 4'b0000: (inst[14:12]==3'b110)? 4'b0001: (inst[30]==0)? 4'b0010: 4'b0110;
endmodule
