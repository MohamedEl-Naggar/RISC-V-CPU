`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2019 03:19:43 PM
// Design Name: 
// Module Name: ALU32bit
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


module ALU32bit (
input [31:0] in1, in2,
input [3:0] aluSel,
output reg [31:0] result, output zero
);
wire [31:0] inrca2, outrca;
assign inrca2 = (aluSel == 6) ? (in2 ^ {32{1'b1}}) : in2;
RCA32 rca ((aluSel == 6), in1, inrca2, outrca);
wire [31:0] ops [15:0];
assign ops[0] = in1 & in2;
assign ops[1] = in1 | in2;
assign ops[2] = outrca;
assign ops[6] = outrca; 
assign ops[7] = 0; 
assign ops[8] = 0; 
assign ops[9] = 0; 
assign ops[10] = 0; 
assign ops[11] = 0; 
assign ops[12] = 0; 
assign ops[13] = 0; 
assign ops[14] = 0; 
assign ops[15] = 0; 
assign ops[3] = 0; 
assign ops[4] = 0; 
assign ops[5] = 0; 


assign zero = (result == 0)? 1 : 0;
always @(*)
begin
    result = ops[aluSel];
end
endmodule

