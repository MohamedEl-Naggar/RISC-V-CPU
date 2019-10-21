`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 03:02:22 PM
// Design Name: 
// Module Name: CU
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


module CU(input [31:0] inst, output Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, [1:0] ALUop);
assign Branch = inst[6];
assign MemRead = ~inst[5];
assign MemtoReg = ~inst[5];
assign MemWrite = ~inst[6] & inst[5] & ~inst[4];
assign ALUSrc = ~(inst[6] | inst[4]);
assign RegWrite = ~(inst[5] ^ inst[4]);
assign ALUop[1] = inst[4];
assign ALUop[0] = inst[6];
endmodule
