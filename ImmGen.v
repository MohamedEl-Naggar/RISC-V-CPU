`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 03:09:05 PM
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(input [31:0] inst, output reg [31:0] imm);
always @(inst)
begin
    if (inst[6] == 0)
    begin
        if (inst[5] == 0)
            imm = inst[31:20];
        else
            imm = {inst[31:25],inst[11:7]};
        
    end
    else
        imm = {inst[31], inst[7], inst[30:25], inst[11:8]};
    if (imm[11])
        imm[31:12] = 20'b11111111111111111111;
end
endmodule

